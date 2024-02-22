import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_form_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/template/upload_photo_button.dart';

class MealForm extends StatelessWidget {
  MealForm({super.key});

  final GlobalKey<FormState> mealForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(GetCategoriesEvent(context: context));
    context.read<MealFormBloc>().add(MealFormUpdateEvent(
            mealModel: MealModel(
          code: CodeGenerator.getRandomCode(15),
          isOrder: true,
          isPreOrder: false,
          categoriesids: [],
        )));

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
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel: state.mealModel
                                        .copyWith(photo: image.toString())));
                          },
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                        TextFormFieldTemplate(
                          label: S.of(context).mealName,
                          labelIcon: 'assets/images/meal_name.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          onSave: (value) {
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel:
                                        state.mealModel.copyWith(name: value)));
                          },
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).ingredients,
                          labelIcon: 'assets/images/ingredient.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).calories,
                          labelIcon: 'assets/images/calories.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          textInputType: TextInputType.number,
                          onSave: (value) {
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel: state.mealModel.copyWith(
                                        caloriesValue:
                                            int.tryParse(value, radix: 0))));
                          },
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).description,
                          labelIcon: 'assets/images/description.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).preparationTime,
                          labelHint: S.of(context).min,
                          labelIcon: 'assets/images/preperation_time.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        TextFormFieldTemplate(
                          label: S.of(context).price,
                          labelHint: S.of(context).currency,
                          labelIcon: 'assets/images/price.svg',
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          onSave: (value) {
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel: state.mealModel.copyWith(
                                        price1:
                                            int.tryParse(value, radix: 0))));
                          },
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultLineGap),
                        BlocConsumer<CategoriesBloc, CategoriesState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var category
                                    in state.categoriesModelList ?? [])
                                  BlocConsumer<MealFormBloc, MealFormState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: ThemeSelector
                                                .statics.defaultGap),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Checkbox(
                                              value: state
                                                  .mealModel.categoriesids
                                                  ?.contains(category.id),
                                              onChanged: (bool? value) {
                                                var listCat = state.mealModel
                                                        .categoriesids ??
                                                    [];

                                                if (value == true) {
                                                  listCat.add(category.id);
                                                } else {
                                                  listCat.removeWhere(
                                                      (element) =>
                                                          element ==
                                                          category.id);
                                                }
                                                context
                                                    .read<MealFormBloc>()
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
                              ],
                            );
                          },
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
                              onPressed: () {
                                if (mealForm.currentState!.validate()) {
                                  mealForm.currentState!.save();
                                  print(state.mealModel.toJson());
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
