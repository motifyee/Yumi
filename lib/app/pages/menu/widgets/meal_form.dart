import 'dart:developer';

import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/ingredient_form/ingredients_form_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal_form/meal_form_cubit.dart';
import 'package:yumi/app/pages/menu/widgets/Ingredients_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/profile/components/upload_photo_button.dart';
import 'package:yumi/validators/required_validator.dart';

class MealForm extends StatelessWidget {
  MealForm({super.key, this.meal, this.menuTarget});

  final MenuTarget? menuTarget;
  Meal? meal;

  bool isLoaded = false;
  bool isEdit = false;

  final GlobalKey<FormState> mealForm = GlobalKey<FormState>();

  final GlobalKey<FormState> ingredientForm = GlobalKey<FormState>();

  fetchMeal({required Meal meal, required BuildContext context}) async {
    final task = await GetMealById().call(GetMealByIdParams(mealId: meal.id!));

    task.fold((l) => isLoaded = true, (r) {
      this.meal = r;
      isLoaded = true;
      context.read<MealFormCubit>().update(
          mealModel: this.meal!.copyWith(
                preparationTime: 25,
                isOrder: meal.isPreOrder == true ? false : true,
                isPreOrder: meal.isPreOrder ?? false,
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Meal getMeal() => isLoaded ? context.read<MealFormCubit>().state.mealModel : meal!;
    if (!isLoaded) {
      if (meal != null) {
        isEdit = true;
        fetchMeal(meal: meal!, context: context);
      } else {
        meal = Meal(
            code: CodeGenerator.getRandomCode(),
            categoriesIds: [],
            ingredients: [],
            isOrder: menuTarget == MenuTarget.order,
            isPreOrder: menuTarget == MenuTarget.preOrder,
            preparationTime: 25,
            isPickUpOnly: false,
            name: '',
            photo: null,
            id: 0,
            caloriesValue: 0,
            portionPersons: 0,
            price1: 0,
            productVariantID: 0,
            chefId: '');
        context.read<MealFormCubit>().update(mealModel: meal!).then((e) => isLoaded = true);
      }
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Form(
            key: mealForm,
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultBlockGap),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Image
                      BlocSelector<MealFormCubit, MealFormState, String?>(
                        selector: (state) => state.mealModel.photo,
                        builder: (context, photo) {
                          return Column(
                            children: [
                              UploadPhotoButton(
                                defaultImage: getMeal().photo,
                                onPressed: (image) {
                                  if (image != null) {
                                    meal = meal?.copyWith(photo: image.toString());
                                    context.read<MealFormCubit>().update(mealModel: getMeal().copyWith(photo: image.toString()));
                                  }
                                },
                              ),
                              if (photo == null) Text(S.of(context).required, style: Theme.of(context).textTheme.titleSmall),
                              const SizedBox(height: CommonDimens.defaultBlockGap),
                            ],
                          );
                        },
                      ),

                      // Fields
                      Column(
                        children: [
                          // Meal
                          TextFormFieldTemplate(
                            label: S.of(context).mealName,
                            labelIcon: 'assets/images/meal_name.svg',
                            borderStyle: TextFormFieldBorderStyle.borderBottom,
                            initialValue: getMeal().name,
                            validators: requiredValidator,
                            inputFormatters: [FilteringTextInputFormatter.allow(CustomRegex.lettersNumbersBlankOnly)],
                            onChange: (value) {
                              context.read<MealFormCubit>().update(mealModel: getMeal().copyWith(name: value ?? ''));
                            },
                          ),

                          const SizedBox(height: CommonDimens.defaultLineGap),

                          // Ingredients
                          BlocSelector<MealFormCubit, MealFormState, List<Ingredient>?>(
                            selector: (state) {
                              return state.mealModel.ingredients;
                            },
                            builder: (context, ingredients) {
                              return TextFormFieldTemplate(
                                key: const Key('ingredients_meal_form'),
                                label: S.of(context).ingredients,
                                labelIcon: 'assets/images/ingredient.svg',
                                borderStyle: TextFormFieldBorderStyle.borderBottom,
                                initialValue: getMeal().ingredients?.map((e) => '${e.portionGrams} ${e.name}').join(', '),
                                validators: requiredValidator,
                                readOnly: true,
                                onTap: () {
                                  context.read<IngredientsFormCubit>().update(ingredientsModel: getMeal().ingredients ?? []);
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => IngredientsForm(
                                      ingredientFormKey: ingredientForm,
                                    ),
                                  );
                                },
                              );
                            },
                          ),

                          const SizedBox(height: CommonDimens.defaultLineGap),

                          // CaloriesValue
                          TextFormFieldTemplate(
                            label: S.of(context).calories,
                            labelIcon: 'assets/images/calories.svg',
                            borderStyle: TextFormFieldBorderStyle.borderBottom,
                            textInputType: TextInputType.number,
                            initialValue: getMeal().caloriesValue?.toTextField,
                            validators: requiredValidator,
                            inputFormatters: [FilteringTextInputFormatter.allow(CustomRegex.numberWith2DecimalOnly)],
                            onChange: (value) {
                              context.read<MealFormCubit>().update(mealModel: getMeal().copyWith(caloriesValue: double.tryParse(value)));
                            },
                          ),

                          const SizedBox(height: CommonDimens.defaultLineGap),

                          // PreparationTime
                          BlocSelector<MealFormCubit, MealFormState, double?>(
                            selector: (state) {
                              return state.mealModel.preparationTime;
                            },
                            builder: (context, prepTime) => TextFormFieldTemplate(
                              label: S.of(context).preparationTime,
                              labelHint: '(${S.of(context).min})',
                              labelIcon: 'assets/images/preperation_time.svg',
                              subLabel: S.of(context).maximum25Minutes,
                              enabled: false,
                              borderStyle: TextFormFieldBorderStyle.borderBottom,
                              validators: requiredValidator,
                              onChange: (value) {
                                context.read<MealFormCubit>().update(mealModel: getMeal().copyWith(preparationTime: double.tryParse(value)));
                              },
                              textInputType: TextInputType.number,
                              initialValue: prepTime?.toTextField,
                            ),
                          ),
                          const SizedBox(height: CommonDimens.defaultLineGap),

                          // Price1
                          TextFormFieldTemplate(
                            label: S.of(context).price,
                            labelHint: '(${S.of(context).currency})',
                            labelIcon: 'assets/images/price.svg',
                            borderStyle: TextFormFieldBorderStyle.borderBottom,
                            initialValue: getMeal().price1?.toTextField,
                            validators: requiredValidator,
                            inputFormatters: [FilteringTextInputFormatter.allow(CustomRegex.numberWith2DecimalOnly)],
                            onChange: (value) {
                              context.read<MealFormCubit>().update(mealModel: getMeal().copyWith(price1: double.tryParse(value)));
                            },
                            textInputType: TextInputType.number,
                          ),

                          const SizedBox(height: CommonDimens.defaultLineGap),

                          // PortionPersons
                          TextFormFieldTemplate(
                            label: S.of(context).portion,
                            labelHint: '(${S.of(context).forHowManyPerson})',
                            labelIcon: 'assets/images/description.svg',
                            borderStyle: TextFormFieldBorderStyle.borderBottom,
                            initialValue: getMeal().portionPersons?.toTextField,
                            textInputType: TextInputType.number,
                            validators: requiredValidator,
                            inputFormatters: [FilteringTextInputFormatter.allow(CustomRegex.numberOnly)],
                            onChange: (value) {
                              context.read<MealFormCubit>().update(mealModel: getMeal().copyWith(portionPersons: double.tryParse(value)));
                            },
                          ),

                          const SizedBox(height: CommonDimens.defaultLineGap),

                          // Categoreis
                          BlocProvider(
                            create: (context) => CategoriesCubit(),
                            child: BlocConsumer<CategoriesCubit, CategoriesState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return PaginationTemplate(
                                  loadDate: () => context.read<CategoriesCubit>().getAllCategories(
                                        isPreOrder: menuTarget == MenuTarget.preOrder,
                                      ),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: state.categoriesPage.data.isEmpty
                                        ? [const PacmanLoadingWidget()]
                                        : [
                                            for (var category in state.categoriesPage.data ?? [])
                                              BlocConsumer<MealFormCubit, MealFormState>(
                                                listener: (context, state) {},
                                                builder: (context, state) {
                                                  return Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultGap),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Checkbox(
                                                          value: state.mealModel.categoriesIds?.contains(category.id) ?? false,
                                                          onChanged: (bool? value) {
                                                            var listCat = List<int>.from(state.mealModel.categoriesIds ?? []);

                                                            if (value == true) {
                                                              listCat.add(category.id);
                                                            } else {
                                                              listCat.removeWhere((element) => element == category.id);
                                                            }
                                                            context.read<MealFormCubit>().update(mealModel: state.mealModel.copyWith(categoriesIds: listCat));
                                                          },
                                                        ),
                                                        Text(category.name),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            SizedBox(
                                              width: CommonDimens.defaultTitleGap,
                                              child: state.categoriesPage.isLoading ? const PacmanLoadingWidget(size: CommonDimens.defaultTitleGap) : const Text(''),
                                            ),
                                          ],
                                  ),
                                );
                              },
                            ),
                          ),

                          // Categories Required
                          if (meal?.categoriesIds?.isEmpty ?? true)
                            Text(
                              S.of(context).required,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),

                          const SizedBox(height: CommonDimens.defaultLineGap),

                          // Save Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.router.popForced();
                                },
                                child: Text(
                                  S.of(context).cancel,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              _SaveBTN(
                                menuTarget: menuTarget,
                                meal: meal,
                                mealForm: mealForm,
                                isEdit: isEdit,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SaveBTN extends StatefulWidget {
  _SaveBTN({
    required this.mealForm,
    required this.menuTarget,
    required this.meal,
    required this.isEdit,
  });
  final GlobalKey<FormState> mealForm;

  final MenuTarget? menuTarget;
  final Meal? meal;
  final bool isEdit;

  bool loading = false;
  @override
  State<_SaveBTN> createState() => _SaveBTNState();
}

class _SaveBTNState extends State<_SaveBTN> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealFormCubit, MealFormState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () async {
            if (widget.loading) return;
            if (widget.mealForm.currentState!.validate() && state.mealModel.categoriesIds!.isNotEmpty && state.mealModel.photo != null) {
              widget.mealForm.currentState!.save();

              setState(() {
                widget.loading = true;
              });

              if (widget.isEdit) {
                await context.read<MealFormCubit>().updateMeal(meal: state.mealModel);
              } else {
                await context.read<MealFormCubit>().createMeal(meal: state.mealModel);
              }

              setState(() {
                widget.loading = false;
              });
            }
          },
          child: widget.loading
              ? const PacmanLoadingWidget(size: CommonFontSize.font_24)
              : Text(
                  S.of(context).save,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
        );
      },
    );
  }
}
