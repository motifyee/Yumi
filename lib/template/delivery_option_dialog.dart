import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/basket/basket_form_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class DeliveryOptionDialog extends StatelessWidget {
  DeliveryOptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * .9,
        padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
        decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          borderRadius:
              BorderRadius.circular(ThemeSelector.statics.defaultBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultBlockGap),
                  child: Text(
                    '${S.of(context).hi} ${context.read<UserBloc>().state.user.userName}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            BlocConsumer<BasketFormBloc, BasketFormState>(
              listener: (context, state) {},
              builder: (context, state) {
                bool? _option = state.invoice.isDelivery;
                return Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<BasketFormBloc>().add(
                                BasketFormUpdateEvent(
                                    invoice: state.invoice.copyWith(
                                        isPickup: true, isDelivery: false),
                                    isPickUpOnly: false),
                              );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  ThemeSelector.statics.defaultInputGap),
                          child: Row(
                            children: [
                              Container(
                                width: ThemeSelector.statics.defaultLineGap,
                                height: ThemeSelector.statics.defaultLineGap,
                                decoration: BoxDecoration(
                                    color: _option != true
                                        ? ThemeSelector.colors.primary
                                        : ThemeSelector.colors.secondaryFaint,
                                    borderRadius: BorderRadius.circular(
                                        ThemeSelector.statics.defaultLineGap)),
                              ),
                              SizedBox(width: ThemeSelector.statics.defaultGap),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).pickup,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<BasketFormBloc>()
                              .add(BasketFormUpdateEvent(
                                invoice: state.invoice.copyWith(
                                    isPickup: false, isDelivery: true),
                                isPickUpOnly: false,
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  ThemeSelector.statics.defaultInputGap),
                          child: Row(
                            children: [
                              Container(
                                width: ThemeSelector.statics.defaultLineGap,
                                height: ThemeSelector.statics.defaultLineGap,
                                decoration: BoxDecoration(
                                    color: _option == true
                                        ? ThemeSelector.colors.primary
                                        : ThemeSelector.colors.secondaryFaint,
                                    borderRadius: BorderRadius.circular(
                                        ThemeSelector.statics.defaultLineGap)),
                              ),
                              SizedBox(width: ThemeSelector.statics.defaultGap),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).delivery,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      context.router.popForced();
                    },
                    child: Text(
                      S.of(context).cancel,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: ThemeSelector.fonts.font_12),
                    )),
                SizedBox(width: ThemeSelector.statics.defaultLineGap),
                TextButton(
                    onPressed: () {
                      context
                          .read<BasketFormBloc>()
                          .add(BasketFormPostRequestEvent(context: context));
                    },
                    child: Text(
                      S.of(context).placeOrder,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
