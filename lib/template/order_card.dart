import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/service/order_service.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/product_in_card.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_currency.dart';

class OrderCard extends StatefulWidget {
  OrderCard(
      {super.key,
      required this.order,
      required this.orderCardTargetPage,
      required this.getApiKey,
      required this.menuTarget});

  late OrderModel order;
  bool isView = false;
  final OrderCardTargetPage orderCardTargetPage;
  final String getApiKey;
  final MenuTarget menuTarget;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> with TickerProviderStateMixin {
  getOrderForView() {
    OrderService.getOrderOrPreOrderDriverById(
            apiKeys: ApiKeys.orderDriverAvailableById,
            id: widget.order.id.toString())
        .then((value) {
      setState(() {
        widget.order = widget.order.copyWith(
            invoiceDetails: OrderModel.fromJson(value.data).invoiceDetails);
      });
    });
  }

  @override
  void initState() {
    if ((widget.order.invoiceDetails?.length ?? 0) < 2 ||
        AppTarget.user == AppTargetUser.drivers) {
      widget.isView = true;
    }

    if (widget.orderCardTargetPage == OrderCardTargetPage.view) {
      getOrderForView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime? createdDate = DateTime.tryParse(widget.order.createdDate ?? '');

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
                            if (createdDate != null)
                              Text(
                                '${createdDate.day}-${createdDate.month}-${createdDate.year} | '
                                '${createdDate.hour < 10 ? 0 : ''}${createdDate.hour}:${createdDate.minute < 10 ? 0 : ''}${createdDate.minute}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(fontWeight: FontWeight.w300),
                              ),
                          ],
                        ),
                        if (AppTarget.user != AppTargetUser.drivers)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ThemeSelector.statics.defaultGap,
                              vertical: ThemeSelector.statics.defaultMicroGap,
                            ),
                            decoration: BoxDecoration(
                                color: ThemeSelector.colors.backgroundTant,
                                borderRadius: BorderRadius.circular(
                                    ThemeSelector
                                        .statics.defaultBorderRadiusMedium)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(widget.order.isPickUp == true
                                    ? 'assets/images/pickup_icon.svg'
                                    : 'assets/images/delivery_icon.svg'),
                                Text(' '),
                                Text(widget.order.isPickUp == true
                                    ? S.of(context).pickup
                                    : S.of(context).delivery)
                              ],
                            ),
                          ),
                        if (AppTarget.user == AppTargetUser.drivers)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ThemeSelector.statics.defaultGap,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    if (!await launchUrl(
                                      Uri(
                                        scheme: 'tel',
                                        path: widget.order.clientMobile,
                                      ),
                                    )) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: SnackBarMassage(
                                            massage: S
                                                .of(context)
                                                .noAccessToDailSystem,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    width:
                                        ThemeSelector.statics.defaultBlockGap,
                                    height:
                                        ThemeSelector.statics.defaultBlockGap,
                                    padding: EdgeInsets.all(
                                        ThemeSelector.statics.defaultMicroGap),
                                    decoration: BoxDecoration(
                                        color: ThemeSelector.colors.primary,
                                        borderRadius: BorderRadius.circular(
                                            ThemeSelector
                                                .statics.defaultBlockGap)),
                                    child: SvgPicture.asset(
                                        'assets/images/calling.svg'),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        ThemeSelector.statics.defaultInputGap),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                        ThemeSelector.statics.defaultBlockGap,
                                    height:
                                        ThemeSelector.statics.defaultBlockGap,
                                    padding: EdgeInsets.all(
                                        ThemeSelector.statics.defaultMicroGap),
                                    decoration: BoxDecoration(
                                        color: ThemeSelector.colors.primary,
                                        borderRadius: BorderRadius.circular(
                                            ThemeSelector
                                                .statics.defaultBlockGap)),
                                    child: SvgPicture.asset(
                                        'assets/images/chat.svg'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    if (widget.order.invoiceDetails!.isNotEmpty)
                      Column(
                        children: [
                          SizedBox(height: ThemeSelector.statics.defaultGap),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/label_yellow.svg'),
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
                        ],
                      ),
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    if (widget.order.invoiceDetails!.isEmpty &&
                        [
                          OrderCardTargetPage.driverAccept,
                          OrderCardTargetPage.driverReceived,
                          OrderCardTargetPage.driverHistory,
                        ].contains(widget.orderCardTargetPage))
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: ThemeSelector.statics.defaultGap),
                              Text(
                                widget.order.clientName ?? '',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                widget.order.clientDefaultAddress ?? '',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                  height: ThemeSelector.statics.defaultGap),
                            ],
                          ),
                        ],
                      ),
                    if (widget.order.invoiceDetails!.isNotEmpty)
                      LayoutBuilder(
                        builder: (context, constraints) => AnimatedSize(
                          duration: ThemeSelector.statics.animationDuration,
                          child: SizedBox(
                            height: widget.isView
                                ? (widget.order.invoiceDetails?.length ?? 0) *
                                    55
                                : 50,
                            width: constraints.maxWidth,
                            child: Stack(
                              children: [
                                AnimatedSize(
                                  duration:
                                      ThemeSelector.statics.animationDuration,
                                  child: SizedBox(
                                    height: widget.isView
                                        ? (widget.order.invoiceDetails
                                                    ?.length ??
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
                                    width: widget.isView
                                        ? constraints.maxWidth
                                        : 50,
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
                        OrderCardTargetPage.chefReady)
                      TextButton(
                        onPressed: () {
                          String _apiKey = '';
                          if (widget.menuTarget == MenuTarget.order) {
                            _apiKey = widget.order.isPickUp == true
                                ? ApiKeys.orderChefPickUpFinished
                                : ApiKeys.orderChefDeliveryFinished;
                          } else {
                            _apiKey = widget.order.isPickUp == true
                                ? ApiKeys.preOrderChefPickUpFinished
                                : ApiKeys.preOrderChefDeliveryFinished;
                          }

                          context.read<OrderBloc>().add(
                                OrderEvent.putAction(
                                  order: widget.order,
                                  apiKey: ApiKeys.actionApiKeyString(
                                      apiKey: _apiKey,
                                      id: '${widget.order.id}'),
                                  getApiKey: widget.getApiKey,
                                ),
                              );
                        },
                        child: Text(
                          S.of(context).start,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    if (widget.orderCardTargetPage ==
                        OrderCardTargetPage.chefPreparing)
                      TextButton(
                        onPressed: () {
                          String _apiKey = '';
                          if (widget.menuTarget == MenuTarget.order) {
                            _apiKey = widget.order.isPickUp == true
                                ? ApiKeys.orderChefPickUpStart
                                : ApiKeys.orderChefDeliveryStart;
                          } else {
                            _apiKey = widget.order.isPickUp == true
                                ? ApiKeys.preOrderChefPickUpStart
                                : ApiKeys.preOrderChefDeliveryStart;
                          }

                          context.read<OrderBloc>().add(
                                OrderEvent.putAction(
                                  order: widget.order,
                                  apiKey: ApiKeys.actionApiKeyString(
                                      apiKey: _apiKey,
                                      id: '${widget.order.id}'),
                                  getApiKey: widget.getApiKey,
                                ),
                              );
                        },
                        child: Text(
                          S.of(context).start,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    if (widget.orderCardTargetPage ==
                            OrderCardTargetPage.chefReceived &&
                        widget.menuTarget == MenuTarget.preOrder)
                      TextButton(
                        onPressed: () {
                          String _apiKey = widget.order.isPickUp == true
                              ? ApiKeys.preOrderChefPickUpAccept
                              : ApiKeys.preOrderChefDeliveryAccept;

                          context.read<OrderBloc>().add(
                                OrderEvent.putAction(
                                  order: widget.order,
                                  apiKey: ApiKeys.actionApiKeyString(
                                      apiKey: _apiKey,
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
                            OrderCardTargetPage.driverReceived &&
                        widget.order.chefFinished == true)
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
                        OrderCardTargetPage.customerHistory)
                      TextButton(
                        onPressed: () {
                          context.router.push(OrderStatusRoute());
                        },
                        child: Text(
                          S.of(context).orderStatus,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    if ((widget.order.invoiceDetails?.length ?? 0) > 1 &&
                        AppTarget.user != AppTargetUser.drivers)
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
                    if (AppTarget.user == AppTargetUser.drivers &&
                        widget.orderCardTargetPage != OrderCardTargetPage.view)
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            constraints: BoxConstraints.tightFor(),
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: ThemeSelector
                                            .statics.defaultBlockGap),
                                    decoration: BoxDecoration(
                                        color: ThemeSelector.colors.background,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(ThemeSelector
                                              .statics.defaultBlockGap),
                                          topRight: Radius.circular(
                                              ThemeSelector
                                                  .statics.defaultBlockGap),
                                        )),
                                    child: OrderCard(
                                      menuTarget: widget.menuTarget,
                                      getApiKey: widget.getApiKey,
                                      orderCardTargetPage:
                                          OrderCardTargetPage.view,
                                      order: widget.order,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
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
