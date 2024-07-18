import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/domain/basket/entity/invoice_detail.dart';
import 'package:yumi/domain/meal/entities/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/extensions/capitalize_string_extension.dart';
import 'package:yumi/app/pages/menu/widgets/customer_pre_order_form.dart';
import 'package:yumi/generated/l10n.dart';

@RoutePage()
class MealProfileScreen extends StatelessWidget {
  const MealProfileScreen({super.key, required this.meal, required this.chef});

  final Meal meal;
  final Chef chef;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: CommonColors.background),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: CommonDimens.defaultImageHeightLarge,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(CommonDimens.defaultLineGap),
                bottomRight: Radius.circular(CommonDimens.defaultLineGap),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultBlockGap),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: CommonDimens.defaultGap),
                      child: Row(
                        children: [
                          BlocBuilder<MealCubit, MealState>(
                            builder: (context, state) {
                              Meal meal = state.pagination.data
                                      .firstWhereOrNull(
                                          (e) => e.id == this.meal.id) ??
                                  this.meal;
                              return TextButton(
                                onPressed: () {
                                  if (meal.isFavoriteProduct == true) {
                                    context
                                        .read<MealCubit>()
                                        .removeFavoriteMeal(meal: meal);
                                  } else {
                                    context
                                        .read<MealCubit>()
                                        .addFavoriteMeal(meal: meal);
                                  }
                                },
                                child: SvgPicture.asset(
                                  meal.isFavoriteProduct == true
                                      ? 'assets/images/heart.svg'
                                      : 'assets/images/heart_outline.svg',
                                  colorFilter: ColorFilter.mode(
                                      CommonColors.primary, BlendMode.srcIn),
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
                              const SizedBox(
                                  height: CommonDimens.defaultElevation),
                              const TextCurrency(
                                value: 4.5,
                                fontSize: CommonFontSize.font_12,
                              ),
                            ],
                          ),
                          const SizedBox(width: CommonDimens.defaultGap),
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
                              const SizedBox(
                                  height: CommonDimens.defaultElevation),
                              Text(
                                meal.portionPersons?.toString() ?? '',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: CommonDimens.defaultGap),
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
                                        fontSize: CommonFontSize.font_24),
                              ),
                              if (meal.ingredients != null)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: CommonDimens.defaultInputGap),
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
                          value: meal.price1 ?? 0,
                          fontSize: CommonFontSize.font_24,
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       vertical: CommonDimens.defaultGap),
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.star,
                    //         color: CommonColors.warning,
                    //         size: CommonFontSize.font_12,
                    //       ),
                    //       SizedBox(
                    //           width: CommonDimens.defaultElevation),
                    //       Text('4.2',
                    //           style: Theme.of(context).textTheme.labelMedium),
                    //       SizedBox(
                    //           width: CommonDimens.defaultElevation),
                    //       Text('(2K ${S.of(context).reviews})',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .labelSmall
                    //               ?.copyWith(fontWeight: FontWeight.w700)),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: CommonDimens.defaultBlockGap),
                    Text(S.of(context).nutritionalValuePer100g,
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: CommonDimens.defaultGap),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          meal.caloriesValue?.toString() ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: CommonColors.secondaryTant),
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
                        basket: context
                            .read<BasketCubit>()
                            .state
                            .basket
                            .copyWith(
                              isPreorder: false,
                              isSchedule: false,
                              isPickupOnly: chef.pickupOnly == true,
                              shippedAddressId:
                                  context.read<UserCubit>().state.address?.id,
                              invoiceDetails: [
                                InvoiceDetail.fromMeal(meal: meal)
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: CommonDimens.defaultBlockGap,
                      vertical: CommonDimens.defaultMicroGap),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(CommonDimens.defaultInputGap),
                      border:
                          Border.all(color: CommonColors.primary, width: 1)),
                  child: Text(
                    S.of(context).add,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )),
            const SizedBox(height: CommonDimens.defaultGap),
          ],
        ));
  }
}
