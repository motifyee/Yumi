import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/product_in_card.dart';
import 'package:yumi/template/text_currency.dart';

class OrderCard extends StatefulWidget {
  OrderCard(
      {super.key,
      required this.order,
      required this.orderCardTargetPage,
      required this.getApiKey,
      required this.menuTarget});

  final OrderModel order;
  bool isView = false;
  final OrderCardTargetPage orderCardTargetPage;
  final String getApiKey;
  final MenuTarget menuTarget;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if ((widget.order.invoiceDetails?.length ?? 0) < 2) {
      widget.isView = true;
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(
              bottom: ThemeSelector.statics.defaultTitleGap / 4),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultBlockGap,
                  vertical: ThemeSelector.statics.defaultTitleGap,
                ),
                margin: EdgeInsets.only(
                    top: ThemeSelector.statics.defaultTitleGap / 2),
                decoration: BoxDecoration(
                  color: ThemeSelector.colors.onPrimary,
                  boxShadow: [
                    BoxShadow(
                      color:
                          ThemeSelector.colors.secondaryFaint.withOpacity(.3),
                      spreadRadius: 3,
                      blurRadius: 17,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${S.of(context).orderId}: #${widget.order.id}',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              '10-05-2022 | 16:51',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        // TextCurrency(value: 10.00),
                      ],
                    ),
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    if (AppTarget.user == AppTargetUser.chefs)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/label_yellow.svg'),
                          SizedBox(
                            width: ThemeSelector.statics.defaultGap,
                          ),
                          Text(
                            S.of(context).clickTheIconToViewCustomerNotes,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: ThemeSelector.fonts.font_10),
                          ),
                        ],
                      ),
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    LayoutBuilder(
                      builder: (context, constraints) => AnimatedSize(
                        duration: ThemeSelector.statics.animationDuration,
                        child: SizedBox(
                          height: widget.isView
                              ? (widget.order.invoiceDetails?.length ?? 0) * 55
                              : 50,
                          width: constraints.maxWidth,
                          child: Stack(
                            children: [
                              AnimatedSize(
                                duration:
                                    ThemeSelector.statics.animationDuration,
                                child: SizedBox(
                                  height: widget.isView
                                      ? (widget.order.invoiceDetails?.length ??
                                              0) *
                                          55
                                      : 50,
                                  width: constraints.maxWidth,
                                ),
                              ),
                              for (var i = 0;
                                  i <
                                      (widget.order.invoiceDetails?.length ??
                                          0);
                                  i++)
                                AnimatedPositioned(
                                  left: widget.isView ? 0.0 : 30.0 * i,
                                  top: widget.isView ? 55.0 * i : 0.0,
                                  width:
                                      widget.isView ? constraints.maxWidth : 50,
                                  duration:
                                      ThemeSelector.statics.animationDuration,
                                  child: ProductInCard(
                                    isView: widget.isView,
                                    maxWidth: constraints.maxWidth,
                                    invoiceDetails:
                                        widget.order.invoiceDetails![i],
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).deliveryFee,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        TextCurrency(
                          value: widget.order.deliveryAreaPrice ?? 0.0,
                          fontSize: ThemeSelector.fonts.font_14,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).theTotalPriceIncludesTax,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).total,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontSize: ThemeSelector.fonts.font_16,
                                ),
                          ),
                        ),
                        TextCurrency(value: widget.order.finalPrice ?? 0.0),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultGap),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget.orderCardTargetPage ==
                        OrderCardTargetPage.driverReceived)
                      TextButton(
                        onPressed: () {
                          context.read<OrderBloc>().add(
                                OrderEvent.putAction(
                                  order: widget.order,
                                  apiKey: ApiKeys.actionApiKeyString(
                                      apiKey:
                                          widget.menuTarget == MenuTarget.order
                                              ? ApiKeys.orderDriverReceived
                                              : ApiKeys.preOrderDriverReceived,
                                      id: '${widget.order.id}'),
                                  getApiKey: widget.getApiKey,
                                ),
                              );
                        },
                        child: Text(
                          S.of(context).orderReceived,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    if (widget.orderCardTargetPage ==
                        OrderCardTargetPage.driverAccept)
                      TextButton(
                        onPressed: () {
                          context.read<OrderBloc>().add(
                                OrderEvent.putAction(
                                  order: widget.order,
                                  apiKey: ApiKeys.actionApiKeyString(
                                      apiKey:
                                          widget.menuTarget == MenuTarget.order
                                              ? ApiKeys.orderDriverAccept
                                              : ApiKeys.preOrderDriverAccept,
                                      id: '${widget.order.id}'),
                                  getApiKey: widget.getApiKey,
                                ),
                              );
                        },
                        child: Text(
                          S.of(context).accept,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    if (widget.orderCardTargetPage ==
                        OrderCardTargetPage.customerView)
                      TextButton(
                        onPressed: () {
                          context.router.push(OrderStatusRoute());
                        },
                        child: Text(
                          S.of(context).orderStatus,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    if ((widget.order.invoiceDetails?.length ?? 0) > 1)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            widget.isView = !widget.isView;
                          });
                        },
                        child: Text(
                          S.of(context).view,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: ThemeSelector.statics.defaultGap,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: ThemeSelector.statics.defaultGap,
              horizontal: ThemeSelector.statics.defaultBlockGap,
            ),
            decoration: BoxDecoration(
              color: ThemeSelector.colors.primary,
              borderRadius: BorderRadius.circular(
                  ThemeSelector.statics.defaultBorderRadiusMedium),
            ),
            child: Text(
              S.of(context).orderReceived,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
