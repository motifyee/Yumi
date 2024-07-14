import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/domain/basket/entity/invoice.dart';
import 'package:yumi/domain/basket/entity/invoice_detail.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/validators/required_validator.dart';

class CustomerPreOrderForm extends StatelessWidget {
  const CustomerPreOrderForm({
    super.key,
    required this.meal,
    required this.chef,
    required this.isPickUpOnly,
  });

  static GlobalKey<FormState> preOrderForm = GlobalKey<FormState>();

  final Meal meal;
  final Chef chef;
  final bool isPickUpOnly;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketState>(
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
                topRight:
                    Radius.circular(CommonDimens.defaultBorderRadiusExtreme),
                topLeft:
                    Radius.circular(CommonDimens.defaultBorderRadiusExtreme),
              )),
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .9),
          child: Form(
            key: preOrderForm,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                children: [
                  Text(S.of(context).preOrder,
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: CommonDimens.defaultBlockGap),
                  Row(
                    children: [
                      Text(
                        'Hi ${context.read<UserCubit>().state.user.userName}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${S.of(context).pleaseSpecifyTheDayTimeOfDelivery}:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: CommonDimens.defaultBlockGap),
                  Row(
                    children: [
                      SizedBox(
                        width: CommonDimens.defaultGapExtreme,
                        child: Text(
                          '${S.of(context).day}:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(width: CommonDimens.defaultMicroGap),
                      SizedBox(
                        width: CommonDimens.defaultGapXXXL,
                        child: TextFormFieldTemplate(
                          onTap: () {
                            showDialog(
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) => Dialog(
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent,
                                child: Calendar(
                                  currentDate: DateTime.now()
                                      .add(const Duration(days: 1)),
                                  firstDate: DateTime.now()
                                      .add(const Duration(days: 1)),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 7)),
                                  onValueChanged: (value) {
                                    if (value.isNotEmpty) {
                                      context
                                          .read<BasketCubit>()
                                          .updateSchedule(date: value[0]);
                                      context.router.maybePop();
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                          initialValue:
                              '${state.basket.invoice.scheduleDateConstraint.day}/${state.basket.invoice.scheduleDateConstraint.month}/${state.basket.invoice.scheduleDateConstraint.year}',
                          readOnly: true,
                          hintText: S.of(context).deliveryDay,
                          borderStyle: TextFormFieldBorderStyle.borderedRound,
                          validators: requiredValidator,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: CommonDimens.defaultMicroGap),
                  Row(
                    children: [
                      SizedBox(
                        width: CommonDimens.defaultGapExtreme,
                        child: Text(
                          '${S.of(context).time}:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(width: CommonDimens.defaultMicroGap),
                      SizedBox(
                        width: CommonDimens.defaultGapXXXL,
                        child: TextFormFieldTemplate(
                          hintText: S.of(context).deliveryTime,
                          textInputType: TextInputType.number,
                          borderStyle: TextFormFieldBorderStyle.borderedRound,
                          validators: requiredValidator,
                          initialValue:
                              '${state.basket.invoice.scheduleDateConstraint.hour}:${state.basket.invoice.scheduleDateConstraint.minute}',
                          onSave: (value) {
                            context
                                .read<BasketCubit>()
                                .updateSchedule(time: value);
                          },
                          onTap: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              initialEntryMode: TimePickerEntryMode.dial,
                              cancelText: '',
                              confirmText: S.of(context).continue0,
                              barrierLabel: '',
                              errorInvalidText: '',
                              helpText: '',
                              hourLabelText: S.of(context).hour,
                              minuteLabelText: S.of(context).minutes,
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: CommonColors.secondary,
                                      onSurface: CommonColors.secondary,
                                      surface: CommonColors.background,
                                    ),
                                  ),
                                  child: MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child!,
                                  ),
                                );
                              },
                            );
                            context.read<BasketCubit>().updateSchedule(
                                time: picked?.hour != null
                                    ? '${picked?.hour}:${picked?.minute}'
                                    : null);
                          },
                          readOnly: true,
                        ),
                      ),
                      const SizedBox(width: CommonDimens.defaultMicroGap),
                    ],
                  ),
                  const SizedBox(height: CommonDimens.defaultBlockGap),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: CommonDimens.defaultGapXXXL,
                          height: CommonDimens.defaultTitleGapLarge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  CommonDimens.defaultBorderRadius),
                              border: Border.all(
                                  color: CommonColors.primary, width: 1)),
                          child: Center(
                            child: Text(
                              S.of(context).cancel,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: CommonDimens.defaultGap),
                      GestureDetector(
                        onTap: () {
                          if (preOrderForm.currentState!.validate()) {
                            preOrderForm.currentState!.save();

                            context.read<BasketCubit>().createBasket(
                                    basket: Basket(
                                  isPreorder: true,
                                  isSchedule: true,
                                  isPickupOnly: chef.pickupOnly == true,
                                  shippedAddressId: context
                                      .read<UserCubit>()
                                      .state
                                      .address
                                      ?.id,
                                  invoice: Invoice.initial().copyWith(
                                      chefID: chef.id,
                                      scheduleDate: state.basket.invoice
                                          .scheduleDateConstraint),
                                  invoiceDetails: [
                                    InvoiceDetail.fromMeal(meal: meal)
                                  ],
                                ));
                          }
                        },
                        child: Container(
                          width: CommonDimens.defaultGapXXXL,
                          height: CommonDimens.defaultTitleGapLarge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                CommonDimens.defaultBorderRadius),
                            color: CommonColors.primary,
                          ),
                          child: Center(
                            child: Text(
                              S.of(context).continue0,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
