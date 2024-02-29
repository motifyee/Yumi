import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/form/meal_form_bloc.dart';
import 'package:yumi/bloc/meal/ingredient_form/ingredient_form_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/forms/Ingredients_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/service/meal_service.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/loading.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/template/upload_photo_button.dart';
import 'package:yumi/validators/required_validator.dart';

class MealForm extends StatelessWidget {
  MealForm({super.key});

  final GlobalKey<FormState> mealForm = GlobalKey<FormState>();
  final GlobalKey<FormState> ingredientForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(ResetCategoryEvent());

    context.read<MealFormBloc>().add(
          MealFormUpdateEvent(
            mealModel: MealModel(
              code: CodeGenerator.getRandomCode(),
              categoriesids: [],
              ingredients: [],
              isPreOrder: false,
              isOrder: true,
              preparationTime: '25',
            ),
          ),
        );

    return BlocConsumer<MealFormBloc, MealFormState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        UploadPhotoButton(
                          defaultImage: state.mealModel.photo,
                          onPressed: (image) {
                            if (image != null) {
                              context.read<MealFormBloc>().add(
                                  MealFormUpdateEvent(
                                      mealModel: state.mealModel
                                          .copyWith(photo: image.toString())));
                            }
                          },
                        ),
                        if (state.mealModel.photo == null)
                          Text(S.of(context).required,
                              style: TextStyle(
                                color: ThemeSelector.colors.primary,
                              )),
                        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                        TextFormFieldTemplate(
                          label: S.of(context).mealName,
                          labelIcon: 'assets/images/meal_name.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          initialValue: state.mealModel.name,
                          validators: requiredValidator,
                          onChange: (value) {
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel: state.mealModel
                                        .copyWith(name: value ?? '')));
                          },
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).ingredients,
                          labelIcon: 'assets/images/ingredient.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
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
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).calories,
                          labelIcon: 'assets/images/calories.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          textInputType: TextInputType.number,
                          initialValue: state.mealModel.caloriesValue,
                          validators: requiredValidator,
                          onChange: (value) {
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel: state.mealModel
                                        .copyWith(caloriesValue: value)));
                          },
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).preparationTime,
                          labelHint: S.of(context).min,
                          labelIcon: 'assets/images/preperation_time.svg',
                          subLabel: S.of(context).maximum25Minutes,
                          enabled: false,
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
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
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).price,
                          labelHint: S.of(context).currency,
                          labelIcon: 'assets/images/price.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          initialValue: state.mealModel.price1,
                          validators: requiredValidator,
                          onChange: (value) {
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel: state.mealModel
                                        .copyWith(price1: value)));
                          },
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).portion,
                          labelHint: S.of(context).forHowManyPerson,
                          labelIcon: 'assets/images/description.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          initialValue: state.mealModel.portionPersons,
                          textInputType: TextInputType.number,
                          validators: requiredValidator,
                          onChange: (value) {
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel: state.mealModel
                                        .copyWith(portionPersons: value)));
                          },
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        BlocConsumer<CategoriesBloc, CategoriesState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return state.categoriesModelList.isEmpty
                                ? Loading()
                                : PaginationTemplate(
                                    loadDate: () => context
                                        .read<CategoriesBloc>()
                                        .add(GetCategoriesEvent(
                                            context: context)),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        for (var category
                                            in state.categoriesModelList ?? [])
                                          BlocConsumer<MealFormBloc,
                                              MealFormState>(
                                            listener: (context, state) {},
                                            builder: (context, state) {
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: ThemeSelector
                                                        .statics.defaultGap),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Checkbox(
                                                      value: state.mealModel
                                                              .categoriesids
                                                              ?.contains(
                                                                  category
                                                                      .id) ??
                                                          false,
                                                      onChanged: (bool? value) {
                                                        var listCat = state
                                                                .mealModel
                                                                .categoriesids ??
                                                            [];

                                                        if (value == true) {
                                                          listCat
                                                              .add(category.id);
                                                        } else {
                                                          listCat.removeWhere(
                                                              (element) =>
                                                                  element ==
                                                                  category.id);
                                                        }
                                                        context
                                                            .read<
                                                                MealFormBloc>()
                                                            .add(MealFormUpdateEvent(
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
                                          child:
                                              state.paginationHelper.isLoading
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
                        if (state.mealModel.categoriesids?.length == 0)
                          Text(
                            S.of(context).required,
                            style:
                                TextStyle(color: ThemeSelector.colors.primary),
                          ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.router.pop();
                              },
                              child: Text(
                                S.of(context).cancel,
                                style: TextStyle(
                                    color: ThemeSelector.colors.secondary),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (mealForm.currentState!.validate() &&
                                    state.mealModel.categoriesids!.isNotEmpty &&
                                    state.mealModel.photo != null) {
                                  mealForm.currentState!.save();

                                  final res = await MealService.createMeal(
                                      context: context,
                                      mealModel: state.mealModel);
                                  context.read<MealListBloc>().add(
                                      MealListUpdateCategoryEvent(
                                          selectedCategory: 0,
                                          context: context));
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
                              child: Text(
                                S.of(context).save,
                                style: TextStyle(
                                    color: ThemeSelector.colors.primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
