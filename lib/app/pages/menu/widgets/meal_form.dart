import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/meal/form/meal_form_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/meal/ingredient_form/ingredient_form_bloc.dart';
import 'package:yumi/app/pages/menu/widgets/Ingredients_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';
import 'package:yumi/service/meal_service.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/regex.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/pagination_template.dart';
import 'package:yumi/app/components/snack_bar.dart';
import 'package:yumi/app/components/text_form_field.dart';
import 'package:yumi/app/pages/profile/components/upload_photo_button.dart';
import 'package:yumi/validators/required_validator.dart';

class MealForm extends StatelessWidget {
  MealForm({super.key, this.meal, this.menuTarget});

  final GlobalKey<FormState> mealForm = GlobalKey<FormState>();
  final GlobalKey<FormState> ingredientForm = GlobalKey<FormState>();

  final MenuTarget? menuTarget;
  final MealModel? meal;

  fetchMeal({required MealModel meal, required BuildContext context}) async {
    Response res = await MealService.getMealById(mealId: meal.id!);
    MealModel meal0 = MealModel.fromJson(res.data);
    context.read<MealFormBloc>().add(MealFormUpdateEvent(
            mealModel: meal0.copyWith(
          preparationTime: '25',
          isOrder: meal.isPreOrder == true ? false : true,
          isPreOrder: meal.isPreOrder ?? false,
        )));
  }

  @override
  Widget build(BuildContext context) {
    if (meal != null) {
      fetchMeal(meal: meal!, context: context);
    } else {
      context.read<MealFormBloc>().add(
            MealFormUpdateEvent(
              mealModel: MealModel(
                  code: CodeGenerator.getRandomCode(),
                  categoriesids: [],
                  ingredients: [],
                  isOrder: menuTarget == MenuTarget.order,
                  isPreOrder: menuTarget == MenuTarget.preOrder,
                  preparationTime: '25',
                  isPickUpOnly: false,
                  name: '',
                  id: 0,
                  caloriesValue: '',
                  portionPersons: '',
                  price1: '',
                  productVariantID: 0,
                  chefId: ''),
            ),
          );
    }
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return Form(
          key: mealForm,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.defaultBlockGap),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BlocBuilder<MealFormBloc, MealFormState>(
                      buildWhen: (previous, current) =>
                          previous.mealModel.photo != current.mealModel.photo,
                      builder: (context, state) {
                        return Column(
                          children: [
                            UploadPhotoButton(
                              defaultImage: state.mealModel.photo,
                              onPressed: (image) {
                                if (image != null) {
                                  context.read<MealFormBloc>().add(
                                      MealFormUpdateEvent(
                                          mealModel: context
                                              .read<MealFormBloc>()
                                              .state
                                              .mealModel
                                              .copyWith(
                                                  photo: image.toString())));
                                }
                              },
                            ),
                            if (state.mealModel.photo == null)
                              Text(S.of(context).required,
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            SizedBox(
                                height: ThemeSelector.statics.defaultBlockGap),
                          ],
                        );
                      },
                    ),
                    BlocConsumer<MealFormBloc, MealFormState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Column(
                          children: [
                            TextFormFieldTemplate(
                              label: S.of(context).mealName,
                              labelIcon: 'assets/images/meal_name.svg',
                              borderStyle:
                                  TextFormFieldBorderStyle.borderBottom,
                              initialValue: state.mealModel.name,
                              validators: requiredValidator,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    CustomRegex.lettersNumbersBlankOnly)
                              ],
                              onChange: (value) {
                                context.read<MealFormBloc>().add(
                                    MealFormUpdateEvent(
                                        mealModel: state.mealModel
                                            .copyWith(name: value ?? '')));
                              },
                            ),
                            SizedBox(
                                height: ThemeSelector.statics.defaultLineGap),
                            TextFormFieldTemplate(
                              key: const Key('ingredients_meal_form'),
                              label: S.of(context).ingredients,
                              labelIcon: 'assets/images/ingredient.svg',
                              borderStyle:
                                  TextFormFieldBorderStyle.borderBottom,
                              initialValue: state.mealModel.ingredients
                                  ?.map((e) => '${e.portionGrams} ${e.name}')
                                  .join(', '),
                              validators: requiredValidator,
                              readOnly: true,
                              onTap: () {
                                context.read<IngredientFormBloc>().add(
                                    IngredientFormUpdateEvent(
                                        ingredientsModel:
                                            state.mealModel.ingredients ?? []));
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => IngredientsForm(
                                          ingredientFormKey: ingredientForm,
                                        ));
                              },
                            ),
                            SizedBox(
                                height: ThemeSelector.statics.defaultLineGap),
                            TextFormFieldTemplate(
                              label: S.of(context).calories,
                              labelIcon: 'assets/images/calories.svg',
                              borderStyle:
                                  TextFormFieldBorderStyle.borderBottom,
                              textInputType: TextInputType.number,
                              initialValue: state.mealModel.caloriesValue,
                              validators: requiredValidator,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    CustomRegex.numberWith2DecimalOnly)
                              ],
                              onChange: (value) {
                                context.read<MealFormBloc>().add(
                                    MealFormUpdateEvent(
                                        mealModel: state.mealModel
                                            .copyWith(caloriesValue: value)));
                              },
                            ),
                            SizedBox(
                                height: ThemeSelector.statics.defaultLineGap),
                            TextFormFieldTemplate(
                              label: S.of(context).preparationTime,
                              labelHint: '(${S.of(context).min})',
                              labelIcon: 'assets/images/preperation_time.svg',
                              subLabel: S.of(context).maximum25Minutes,
                              enabled: false,
                              borderStyle:
                                  TextFormFieldBorderStyle.borderBottom,
                              validators: requiredValidator,
                              onChange: (value) {
                                context.read<MealFormBloc>().add(
                                    MealFormUpdateEvent(
                                        mealModel: state.mealModel
                                            .copyWith(preparationTime: value)));
                              },
                              textInputType: TextInputType.number,
                              initialValue: state.mealModel.preparationTime,
                            ),
                            SizedBox(
                                height: ThemeSelector.statics.defaultLineGap),
                            TextFormFieldTemplate(
                              label: S.of(context).price,
                              labelHint: '(${S.of(context).currency})',
                              labelIcon: 'assets/images/price.svg',
                              borderStyle:
                                  TextFormFieldBorderStyle.borderBottom,
                              initialValue: state.mealModel.price1,
                              validators: requiredValidator,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    CustomRegex.numberWith2DecimalOnly)
                              ],
                              onChange: (value) {
                                context.read<MealFormBloc>().add(
                                    MealFormUpdateEvent(
                                        mealModel: state.mealModel
                                            .copyWith(price1: value)));
                              },
                              textInputType: TextInputType.number,
                            ),
                            SizedBox(
                                height: ThemeSelector.statics.defaultLineGap),
                            TextFormFieldTemplate(
                              label: S.of(context).portion,
                              labelHint: '(${S.of(context).forHowManyPerson})',
                              labelIcon: 'assets/images/description.svg',
                              borderStyle:
                                  TextFormFieldBorderStyle.borderBottom,
                              initialValue: state.mealModel.portionPersons,
                              textInputType: TextInputType.number,
                              validators: requiredValidator,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    CustomRegex.numberOnly)
                              ],
                              onChange: (value) {
                                context.read<MealFormBloc>().add(
                                    MealFormUpdateEvent(
                                        mealModel: state.mealModel
                                            .copyWith(portionPersons: value)));
                              },
                            ),
                            SizedBox(
                                height: ThemeSelector.statics.defaultLineGap),
                            BlocProvider(
                              create: (context) => CategoriesBloc(),
                              child:
                                  BlocConsumer<CategoriesBloc, CategoriesState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return PaginationTemplate(
                                    loadDate: () => context
                                        .read<CategoriesBloc>()
                                        .add(GetCategoriesEvent(
                                            context: context,
                                            isPreOrder: menuTarget ==
                                                MenuTarget.preOrder,
                                            isAll: true)),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: state
                                              .categoriesModelList.isEmpty
                                          ? [Loading()]
                                          : [
                                              for (var category in state
                                                      .categoriesModelList ??
                                                  [])
                                                BlocConsumer<MealFormBloc,
                                                    MealFormState>(
                                                  listener: (context, state) {},
                                                  builder: (context, state) {
                                                    return Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  ThemeSelector
                                                                      .statics
                                                                      .defaultGap),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Checkbox(
                                                            value: state
                                                                    .mealModel
                                                                    .categoriesids
                                                                    ?.contains(
                                                                        category
                                                                            .id) ??
                                                                false,
                                                            onChanged:
                                                                (bool? value) {
                                                              var listCat = state
                                                                      .mealModel
                                                                      .categoriesids ??
                                                                  [];

                                                              if (value ==
                                                                  true) {
                                                                listCat.add(
                                                                    category
                                                                        .id);
                                                              } else {
                                                                listCat.removeWhere(
                                                                    (element) =>
                                                                        element ==
                                                                        category
                                                                            .id);
                                                              }
                                                              context.read<MealFormBloc>().add(MealFormUpdateEvent(
                                                                  mealModel: state
                                                                      .mealModel
                                                                      .copyWith(
                                                                          categoriesids:
                                                                              listCat)));
                                                            },
                                                          ),
                                                          Text(category.name),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              SizedBox(
                                                width: ThemeSelector
                                                    .statics.defaultTitleGap,
                                                child: state.pager.isLoading
                                                    ? Loading(
                                                        size: ThemeSelector
                                                            .statics
                                                            .defaultTitleGap)
                                                    : const Text(''),
                                              ),
                                            ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (state.mealModel.categoriesids?.isEmpty ?? true)
                              Text(
                                S.of(context).required,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            SizedBox(
                                height: ThemeSelector.statics.defaultLineGap),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    context.router.popForced();
                                  },
                                  child: Text(
                                    S.of(context).cancel,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                _SaveBTN(
                                  menuTarget: menuTarget,
                                  state: state,
                                  meal: meal,
                                  mealForm: mealForm,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _SaveBTN extends StatefulWidget {
  _SaveBTN(
      {required this.mealForm,
      required this.menuTarget,
      required this.meal,
      required this.state});
  final GlobalKey<FormState> mealForm;

  final MenuTarget? menuTarget;
  final MealModel? meal;
  final MealFormState state;

  bool loading = false;
  @override
  State<_SaveBTN> createState() => _SaveBTNState();
}

class _SaveBTNState extends State<_SaveBTN> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (widget.loading) return;
        if (widget.mealForm.currentState!.validate() &&
            widget.state.mealModel.categoriesids!.isNotEmpty &&
            widget.state.mealModel.photo != null) {
          widget.mealForm.currentState!.save();

          setState(() {
            widget.loading = true;
          });

          late dynamic res;
          if (widget.meal != null) {
            res = await MealService.updateMeal(
                context: context, mealModel: widget.state.mealModel);
          } else {
            res = await MealService.createMeal(
                context: context, mealModel: widget.state.mealModel);
          }

          setState(() {
            widget.loading = false;
          });

          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: SnackBarMassage(
                massage: res.toString(),
              ),
            ),
          );
        }
      },
      child: widget.loading
          ? Loading(size: ThemeSelector.fonts.font_24)
          : Text(
              S.of(context).save,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
    );
  }
}
