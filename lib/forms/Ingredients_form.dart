import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/ingredient/ingredient_list_bloc.dart';
import 'package:yumi/bloc/meal/ingredient_form_bloc.dart';
import 'package:yumi/bloc/meal/meal_form_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/required_validator.dart';

class IngredientsForm extends StatelessWidget {
  IngredientsForm({super.key, required this.ingredientFormKey});

  final GlobalKey<FormState> ingredientFormKey;
  IngredientsModel ingredientsModel = IngredientsModel();

  @override
  Widget build(BuildContext context) {
    context
        .read<IngredientListBloc>()
        .add(IngredientListUpdateEvent(context: context));

    List<IngredientsModel> filteredList({
      required List<IngredientsModel> list,
      required List<IngredientsModel> selected,
    }) {
      return list.where((element) {
        return !selected.any((e) => e.id == element.id);
      }).toList();
    }

    return Form(
      key: ingredientFormKey,
      child: BlocConsumer<IngredientFormBloc, IngredientFormState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(
              left: ThemeSelector.statics.defaultBlockGap,
              right: ThemeSelector.statics.defaultBlockGap,
              top: ThemeSelector.statics.defaultGapExtreme,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: ThemeSelector.colors.background,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                      ThemeSelector.statics.defaultBorderRadiusExtreme),
                  topLeft: Radius.circular(
                      ThemeSelector.statics.defaultBorderRadiusExtreme),
                )),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * .9),
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              height: max(200, constraints.maxHeight)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(1),
                                  1: IntrinsicColumnWidth(),
                                  2: IntrinsicColumnWidth(),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: ThemeSelector
                                              .colors.secondaryFaint,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: ThemeSelector
                                                .statics.defaultGap),
                                        child: Text(
                                          S.of(context).ingredients,
                                          style: TextStyle(
                                            color:
                                                ThemeSelector.colors.secondary,
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                ThemeSelector.fonts.font_12,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: ThemeSelector
                                                .statics.defaultGap),
                                        child: Text(
                                          S.of(context).measurement,
                                          style: TextStyle(
                                            color:
                                                ThemeSelector.colors.secondary,
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                ThemeSelector.fonts.font_12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 60),
                                    ],
                                  ),
                                  for (var ingredient
                                      in state.ingredientsModelList)
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: ThemeSelector
                                                .colors.secondaryFaint,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: ThemeSelector
                                                  .statics.defaultGap),
                                          child: Text(
                                            ingredient.name.toString(),
                                            style: TextStyle(
                                              color: ThemeSelector
                                                  .colors.secondary,
                                              fontSize:
                                                  ThemeSelector.fonts.font_12,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: ThemeSelector
                                                  .statics.defaultGap),
                                          child: Text(
                                            ingredient.portionGrams.toString(),
                                            style: TextStyle(
                                              color: ThemeSelector
                                                  .colors.secondary,
                                              fontSize:
                                                  ThemeSelector.fonts.font_12,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<IngredientFormBloc>()
                                                .add(IngredientFormRemoveEvent(
                                                    ingredientsModel:
                                                        ingredient));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: ThemeSelector
                                                    .statics.defaultLineGap,
                                                vertical: ThemeSelector
                                                    .statics.defaultGap),
                                            child: Icon(
                                              Icons.close,
                                              color:
                                                  ThemeSelector.colors.primary,
                                            ),
                                          ),
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
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultGap),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: BlocConsumer<IngredientListBloc,
                            IngredientListState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return TextFormFieldTemplate(
                              borderStyle:
                                  TextFormFieldBorderStyle.borderedRound,
                              objectValidators: requiredObjectValidator,
                              dropdownSelection: true,
                              dropdownSelectionTargetLabel: 'name',
                              dropdownSelectionList: filteredList(
                                  list: state.ingredients,
                                  selected: context
                                      .read<IngredientFormBloc>()
                                      .state
                                      .ingredientsModelList),
                              initialValue: ingredientsModel.id != null
                                  ? state.ingredients.firstWhere(
                                      (e) => e.id == ingredientsModel.id)
                                  : (state.ingredients.isNotEmpty
                                      ? filteredList(
                                          list: state.ingredients,
                                          selected: context
                                              .read<IngredientFormBloc>()
                                              .state
                                              .ingredientsModelList)[0]
                                      : null),
                              onChange: (value) {},
                              onSave: (value) {
                                ingredientsModel.id = value.id;
                                ingredientsModel.name = value.name;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(width: ThemeSelector.statics.defaultGap),
                      Flexible(
                        flex: 1,
                        child: TextFormFieldTemplate(
                          textInputType: TextInputType.number,
                          borderStyle: TextFormFieldBorderStyle.borderedRound,
                          validators: requiredValidator,
                          initialValue: ingredientsModel.portionGrams,
                          onSave: (value) {
                            ingredientsModel.portionGrams = int.tryParse(value);
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (ingredientFormKey.currentState!.validate()) {
                            ingredientFormKey.currentState!.save();

                            context.read<IngredientFormBloc>().add(
                                IngredientFormAddEvent(
                                    ingredientsModel: ingredientsModel));

                            ingredientsModel = IngredientsModel();
                            ingredientFormKey.currentState!.reset();
                          }
                        },
                        child: SvgPicture.asset('assets/images/plus.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultGap),
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
                          )),
                      TextButton(
                          onPressed: () {
                            context.read<MealFormBloc>().add(
                                MealFormUpdateEvent(
                                    mealModel: context
                                        .read<MealFormBloc>()
                                        .state
                                        .mealModel
                                        .copyWith(
                                            ingredients:
                                                state.ingredientsModelList)));
                            context.router.pop();
                          },
                          child: Text(
                            S.of(context).save,
                            style:
                                TextStyle(color: ThemeSelector.colors.primary),
                          )),
                    ],
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultGap),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
