import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/extensions/capitalize_string_extension.dart';
import 'package:yumi/forms/customer_pre_order_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';

@RoutePage()
class MealProfileScreen extends StatelessWidget {
  MealProfileScreen({super.key, required this.meal, required this.chef});

  MealModel meal;
  Chef chef;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: ThemeSelector.colors.background),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: ThemeSelector.statics.defaultImageHeightLarge,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(ThemeSelector.statics.defaultLineGap),
                bottomRight:
                    Radius.circular(ThemeSelector.statics.defaultLineGap),
              )),
              child: Image.memory(
                Uri.parse(meal.photo ?? '').data?.contentAsBytes() ??
                    Uint8List(0),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/354.jpeg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultBlockGap),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ThemeSelector.statics.defaultGap),
                      child: Row(
                        children: [
                          BlocBuilder<MealListBloc, MealListState>(
                            builder: (context, state) {
                              MealModel meal = state.meals.firstWhereOrNull(
                                      (e) => e.id == this.meal.id) ??
                                  this.meal;
                              return TextButton(
                                onPressed: () {
                                  if (meal.isFavoritProduct == true) {
                                    context.read<MealListBloc>().add(
                                        MealListRemoveFavoriteMealEvent(
                                            meal: meal));
                                  } else {
                                    context.read<MealListBloc>().add(
                                        MealListAddFavoriteMealEvent(
                                            meal: meal));
                                  }
                                },
                                child: SvgPicture.asset(
                                  meal.isFavoritProduct == true
                                      ? 'assets/images/heart.svg'
                                      : 'assets/images/heart_outline.svg',
                                  colorFilter: ColorFilter.mode(
                                      ThemeSelector.colors.primary,
                                      BlendMode.srcIn),
                                ),
                              );
                            },
                          ),
                          const Expanded(child: SizedBox.shrink()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).shippingFee,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                  height:
                                      ThemeSelector.statics.defaultElevation),
                              TextCurrency(
                                value: 4.5,
                                fontSize: ThemeSelector.fonts.font_12,
                              ),
                            ],
                          ),
                          SizedBox(width: ThemeSelector.statics.defaultGap),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).portion,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                  height:
                                      ThemeSelector.statics.defaultElevation),
                              Text(
                                meal.portionPersons ?? '',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal.name?.capitalize() ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        fontSize: ThemeSelector.fonts.font_24),
                              ),
                              if (meal.ingredients != null)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ThemeSelector
                                          .statics.defaultInputGap),
                                  child: Text(
                                    meal.ingredients!
                                        .map((e) => '${e.portionGrams} '
                                            '${e.name}')
                                        .join(', '),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        TextCurrency(
                          value: double.parse(meal.price1 ?? '0'),
                          fontSize: ThemeSelector.fonts.font_24,
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       vertical: ThemeSelector.statics.defaultGap),
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.star,
                    //         color: ThemeSelector.colors.warning,
                    //         size: ThemeSelector.fonts.font_12,
                    //       ),
                    //       SizedBox(
                    //           width: ThemeSelector.statics.defaultElevation),
                    //       Text('4.2',
                    //           style: Theme.of(context).textTheme.labelMedium),
                    //       SizedBox(
                    //           width: ThemeSelector.statics.defaultElevation),
                    //       Text('(2K ${S.of(context).reviews})',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .labelSmall
                    //               ?.copyWith(fontWeight: FontWeight.w700)),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                    Text(S.of(context).nutritionalValuePer100g,
                        style: Theme.of(context).textTheme.labelLarge),
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          meal.caloriesValue ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: ThemeSelector.colors.secondaryTant),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (meal.isPreOrder == true) {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => CustomerPreOrderForm(
                        meal: meal,
                        chef: chef,
                        isPickUpOnly: meal.isPickUpOnly ?? false,
                      ),
                    );
                  } else {
                    context.read<BasketCubit>().createBasket(
                        basket:
                            context.read<BasketCubit>().state.basket.copyWith(
                                  isPreorder: false,
                                  isSchedule: false,
                                  isPickupOnly: chef.pickupOnly == true,
                                  invoiceDetails: [
                                    InvoiceDetails.fromMeal(meal: meal)
                                  ],
                                  invoice: context
                                      .read<BasketCubit>()
                                      .state
                                      .basket
                                      .invoice
                                      .copyWith(
                                        chefID: meal.chefId,
                                      ),
                                ));
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultBlockGap,
                      vertical: ThemeSelector.statics.defaultMicroGap),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultInputGap),
                      border: Border.all(
                          color: ThemeSelector.colors.primary, width: 1)),
                  child: Text(
                    S.of(context).add,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )),
            SizedBox(height: ThemeSelector.statics.defaultGap),
          ],
        ));
  }
}
