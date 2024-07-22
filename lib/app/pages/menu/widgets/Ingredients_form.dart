import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/menu/cubit/ingredient_form/ingredients_form_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/ingredient_list/ingredient_list_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal_form/meal_form_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/ingredients/ingredients_cubit.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/validators/required_validator.dart';

class IngredientsForm extends StatelessWidget {
  IngredientsForm({super.key, required this.ingredientFormKey});

  final GlobalKey<FormState> ingredientFormKey;
  Ingredient ingredient = const Ingredient();

  @override
  Widget build(BuildContext context) {
    context.read<IngredientListCubit>().getAllIngredients();

    List<Ingredient> filteredList({
      required List<Ingredient> list,
      required List<Ingredient> selected,
    }) {
      return list.where((element) {
        return !selected.any((e) => e.id == element.id);
      }).toList();
    }

    return Form(
      key: ingredientFormKey,
      child: BlocConsumer<IngredientsFormCubit, IngredientsFormState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(
              left: CommonDimens.defaultBlockGap,
              right: CommonDimens.defaultBlockGap,
              top: CommonDimens.defaultGapExtreme,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: CommonColors.background,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(CommonDimens.defaultBorderRadiusExtreme),
                  topLeft: Radius.circular(CommonDimens.defaultBorderRadiusExtreme),
                )),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(height: max(200, constraints.maxHeight)),
                          child: SingleChildScrollView(
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
                                            color: CommonColors.secondaryFaint,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap),
                                          child: Text(
                                            S.of(context).ingredients,
                                            style: Theme.of(context).textTheme.labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap),
                                          child: Text(
                                            S.of(context).measurement,
                                            style: Theme.of(context).textTheme.labelMedium,
                                          ),
                                        ),
                                        const SizedBox(width: 60),
                                      ],
                                    ),
                                    for (Ingredient ingredient in state.ingredientsModelList)
                                      TableRow(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: CommonColors.secondaryFaint,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap),
                                            child: Text(
                                              ingredient.name.toString(),
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap),
                                            child: Text(
                                              ingredient.portionGrams.toString(),
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.read<IngredientsFormCubit>().add(ingredientsModel: ingredient);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultLineGap, vertical: CommonDimens.defaultGap),
                                              child: Icon(
                                                Icons.close,
                                                color: CommonColors.primary,
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
                  ),
                  const SizedBox(height: CommonDimens.defaultGap),
                  BlocBuilder<IngredientListCubit, IngredientListState>(
                    builder: (context, state) {
                      List<Ingredient> selectFromList = filteredList(list: state.ingredients, selected: context.read<IngredientsFormCubit>().state.ingredientsModelList);
                      return selectFromList.isEmpty
                          ? state.loading
                              ? const PacmanLoadingWidget(size: CommonFontSize.font_38)
                              : const SizedBox.shrink()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: TextFormFieldTemplate(
                                    borderStyle: TextFormFieldBorderStyle.borderedRound,
                                    objectValidators: requiredObjectValidator,
                                    dropdownSelection: true,
                                    dropdownSelectionTargetLabel: 'name',
                                    dropdownSelectionList: selectFromList,
                                    initialValue: ingredient.id != null ? selectFromList.firstWhere((e) => e.id == ingredient.id) : selectFromList.firstOrNull,
                                    onChange: (value) {},
                                    onSave: (value) {
                                      ingredient = ingredient.copyWith(
                                        id: value.id,
                                        name: value.name,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: CommonDimens.defaultGap),
                                Flexible(
                                  flex: 1,
                                  child: TextFormFieldTemplate(
                                    textInputType: TextInputType.number,
                                    borderStyle: TextFormFieldBorderStyle.borderedRound,
                                    validators: requiredValidator,
                                    inputFormatters: [FilteringTextInputFormatter.allow(CustomRegex.numberWith2DecimalOnly)],
                                    initialValue: ingredient.portionGrams,
                                    onSave: (value) {
                                      ingredient = ingredient.copyWith(
                                        portionGrams: double.tryParse(value),
                                      );
                                    },
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (ingredientFormKey.currentState!.validate()) {
                                      ingredientFormKey.currentState!.save();

                                      context.read<IngredientsFormCubit>().add(ingredientsModel: ingredient);

                                      ingredient = const Ingredient();
                                      ingredientFormKey.currentState!.reset();
                                    }
                                  },
                                  child: SvgPicture.asset('assets/images/plus.svg'),
                                ),
                              ],
                            );
                    },
                  ),
                  const SizedBox(height: CommonDimens.defaultGap),
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
                          )),
                      TextButton(
                          onPressed: () {
                            if (state.ingredientsModelList.isNotEmpty) {
                              context.read<MealFormCubit>().updateIngredients(ingredients: state.ingredientsModelList);
                              context.router.popForced();
                            }
                          },
                          child: Text(
                            S.of(context).save,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: CommonColors.primary),
                          )),
                    ],
                  ),
                  const SizedBox(height: CommonDimens.defaultGap),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
