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
  IngredientsForm({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<IngredientListBloc>()
        .add(IngredientListUpdateEvent(context: context));
    return Container(
      padding: EdgeInsets.only(
        left: ThemeSelector.statics.defaultGap,
        right: ThemeSelector.statics.defaultGap,
        top: ThemeSelector.statics.defaultGapExtreme,
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
      child: Column(
        children: [
          SingleChildScrollView(
            child: BlocConsumer<MealFormBloc, MealFormState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultGap),
                  child: Column(
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
                                  color: ThemeSelector.colors.secondaryFaint,
                                  width: 1,
                                ),
                              ),
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: ThemeSelector.statics.defaultGap),
                                child: Text(
                                  S.of(context).ingredients,
                                  style: TextStyle(
                                    color: ThemeSelector.colors.secondary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: ThemeSelector.fonts.font_12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: ThemeSelector.statics.defaultGap),
                                child: Text(
                                  S.of(context).measurement,
                                  style: TextStyle(
                                    color: ThemeSelector.colors.secondary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: ThemeSelector.fonts.font_12,
                                  ),
                                ),
                              ),
                              Text(''),
                            ],
                          ),
                          for (var ingredient
                              in state.mealModel.ingredients ?? [])
                            TableRow(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: ThemeSelector.colors.secondaryFaint,
                                    width: 1,
                                  ),
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          ThemeSelector.statics.defaultGap),
                                  child: Text(
                                    ingredient.name.toString(),
                                    style: TextStyle(
                                      color: ThemeSelector.colors.secondary,
                                      fontSize: ThemeSelector.fonts.font_12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          ThemeSelector.statics.defaultGap),
                                  child: Text(
                                    ingredient.portionGrams.toString(),
                                    style: TextStyle(
                                      color: ThemeSelector.colors.secondary,
                                      fontSize: ThemeSelector.fonts.font_12,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: ThemeSelector
                                              .statics.defaultLineGap,
                                          vertical:
                                              ThemeSelector.statics.defaultGap),
                                      child: Icon(
                                        Icons.close,
                                        color: ThemeSelector.colors.primary,
                                      )),
                                ),
                              ],
                            ),
                        ],
                      ),
                      BlocProvider(
                        create: (context) => IngredientFormBloc(),
                        child: BlocConsumer<IngredientFormBloc,
                            IngredientFormState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: BlocConsumer<IngredientListBloc,
                                      IngredientListState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return TextFormFieldTemplate(
                                        borderStyle: TextFormFieldBorderStyle
                                            .borderedRound,
                                        objectValidators:
                                            requiredObjectValidator,
                                        dropdownSelection: true,
                                        dropdownSelectionTargetLabel: 'name',
                                        dropdownSelectionList:
                                            state.ingredients,
                                        initialValue: context
                                                    .read<IngredientFormBloc>()
                                                    .state
                                                    .ingredientsModel
                                                    .iD !=
                                                null
                                            ? state.ingredients.firstWhere((e) =>
                                                e.iD ==
                                                context
                                                    .read<IngredientFormBloc>()
                                                    .state
                                                    .ingredientsModel
                                                    .iD)
                                            : (state.ingredients.isNotEmpty
                                                ? state.ingredients[0]
                                                : null),
                                        onChange: (value) {
                                          context
                                              .read<IngredientFormBloc>()
                                              .add(IngredientFormUpdateEvent(
                                                  ingredientsModel: context
                                                      .read<
                                                          IngredientFormBloc>()
                                                      .state
                                                      .ingredientsModel
                                                      .copyWith(
                                                          iD: value['iD'],
                                                          name:
                                                              value['name'])));
                                        },
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                    width: ThemeSelector.statics.defaultGap),
                                Flexible(
                                  flex: 1,
                                  child: TextFormFieldTemplate(
                                    textInputType: TextInputType.number,
                                    borderStyle:
                                        TextFormFieldBorderStyle.borderedRound,
                                    validators: requiredValidator,
                                    onChange: (value) {
                                      context.read<IngredientFormBloc>().add(
                                              IngredientFormUpdateEvent(
                                                  ingredientsModel: state
                                                      .ingredientsModel
                                                      .copyWith(
                                            portionGrams: int.tryParse(value),
                                          )));
                                    },
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    List<IngredientsModel> ingList = context
                                            .read<MealFormBloc>()
                                            .state
                                            .mealModel
                                            .ingredients ??
                                        [];
                                    ingList.add(state.ingredientsModel);

                                    context.read<MealFormBloc>().add(
                                        MealFormUpdateEvent(
                                            mealModel: context
                                                .read<MealFormBloc>()
                                                .state
                                                .mealModel
                                                .copyWith(
                                                  ingredients: ingList,
                                                )));
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/plus.svg'),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
