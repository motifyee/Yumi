import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/calendar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/required_validator.dart';

class CustomerPreOrderForm extends StatelessWidget {
  CustomerPreOrderForm(
      {super.key,
      required this.meal,
      required this.chef,
      required this.isPickUpOnly});

  static GlobalKey<FormState> preOrderForm = GlobalKey<FormState>();

  MealModel meal;
  Chef chef;
  bool isPickUpOnly;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketState>(
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
          child: Form(
            key: preOrderForm,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                children: [
                  Text(S.of(context).preOrder,
                      style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                  Row(
                    children: [
                      Text(
                        'Hi ${context.read<UserBloc>().state.user.userName}',
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
                  SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                  Row(
                    children: [
                      SizedBox(
                        width: ThemeSelector.statics.defaultGapExtreme,
                        child: Text(
                          '${S.of(context).day}:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(width: ThemeSelector.statics.defaultMicroGap),
                      SizedBox(
                        width: ThemeSelector.statics.defaultGapXXXL,
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
                                  currentDate:
                                      DateTime.now().add(const Duration(days: 1)),
                                  firstDate:
                                      DateTime.now().add(const Duration(days: 1)),
                                  lastDate:
                                      DateTime.now().add(const Duration(days: 7)),
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
                  SizedBox(height: ThemeSelector.statics.defaultMicroGap),
                  Row(
                    children: [
                      SizedBox(
                        width: ThemeSelector.statics.defaultGapExtreme,
                        child: Text(
                          '${S.of(context).time}:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(width: ThemeSelector.statics.defaultMicroGap),
                      SizedBox(
                        width: ThemeSelector.statics.defaultGapXXXL,
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
                                      primary: ThemeSelector.colors.secondary,
                                      onSurface: ThemeSelector.colors.secondary,
                                      surface: ThemeSelector.colors.background,
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
                      SizedBox(width: ThemeSelector.statics.defaultMicroGap),
                    ],
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: ThemeSelector.statics.defaultGapXXXL,
                          height: ThemeSelector.statics.defaultTitleGapLarge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ThemeSelector.statics.defaultBorderRadius),
                              border: Border.all(
                                  color: ThemeSelector.colors.primary,
                                  width: 1)),
                          child: Center(
                            child: Text(
                              S.of(context).cancel,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: ThemeSelector.statics.defaultGap),
                      GestureDetector(
                        onTap: () {
                          if (preOrderForm.currentState!.validate()) {
                            preOrderForm.currentState!.save();

                            context.read<BasketCubit>().createBasket(
                                    basket: Basket(
                                  isPreorder: true,
                                  isSchedule: true,
                                  isPickupOnly: chef.pickupOnly == true,
                                  invoice: Invoice.initial().copyWith(
                                      chefID: chef.id,
                                      scheduleDate:
                                          state.basket.invoice.scheduleDate),
                                  invoiceDetails: [
                                    InvoiceDetails.fromMeal(meal: meal)
                                  ],
                                ));
                          }
                        },
                        child: Container(
                          width: ThemeSelector.statics.defaultGapXXXL,
                          height: ThemeSelector.statics.defaultTitleGapLarge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ThemeSelector.statics.defaultBorderRadius),
                            color: ThemeSelector.colors.primary,
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
