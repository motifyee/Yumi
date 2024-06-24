import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/order/cubit/order/order_bloc.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/address/entity/address.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/menu/meal.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/service/order_service.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/order/widgets/product_in_card.dart';
import 'package:yumi/app/components/snack_bar.dart';
import 'package:yumi/app/components/text_currency.dart';

class OrderCard extends StatefulWidget {
  OrderCard({
    super.key,
    required this.order,
    required this.orderCardTargetPage,
    required this.getApiKey,
    required this.menuTarget,
    this.navFun,
  });

  late Order order;
  bool isView = false;
  final OrderCardTargetPage orderCardTargetPage;
  final String getApiKey;
  final MenuTarget menuTarget;
  final Function()? navFun;

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
            invoiceDetails: Order.fromJson(value.data).invoiceDetails);
      });
    });
  }

  @override
  void initState() {
    if (widget.orderCardTargetPage == OrderCardTargetPage.view) {
      getOrderForView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime? updatedDate = DateTime.tryParse(widget.order.updatedDate ?? '');
    DateTime? scheduleDate = DateTime.tryParse(widget.order.scheduleDate ?? '');

    if ((widget.order.invoiceDetails?.length ?? 0) < 2 ||
        AppTarget.user == AppTargetUser.drivers) {
      widget.isView = true;
    }

    if (widget.orderCardTargetPage == OrderCardTargetPage.driverAccept) {
      if (widget.menuTarget == MenuTarget.order &&
          widget.order.isDriverOrderPendingEnd) {
        return const SizedBox(height: 0, width: 0);
      }
      if (widget.menuTarget == MenuTarget.preOrder &&
          widget.order.isDriverPreOrderPendingEnd) {
        return const SizedBox(height: 0, width: 0);
      }
    }

    if (widget.orderCardTargetPage == OrderCardTargetPage.chefPending &&
        widget.menuTarget == MenuTarget.preOrder) {
      if (widget.order.isOver3H) return const SizedBox(height: 0, width: 0);
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${S.of(context).orderId}: #${widget.order.id}',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            if (updatedDate != null)
                              Text(
                                DateFormat('d-M-yyyy | hh:mm')
                                    .format(updatedDate),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(fontWeight: FontWeight.w300),
                              ),
                          ],
                        ),
                        if (scheduleDate != null)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ThemeSelector.statics.defaultMicroGap),
                                child: SvgPicture.asset(
                                  'assets/images/schedule_icon.svg',
                                  height: 28,
                                ),
                              ),
                              SizedBox(
                                  width: ThemeSelector.statics.defaultMicroGap),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${S.of(context).scheduleDate}:',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                  Text(
                                    DateFormat('d-M-yyyy | hh:mm')
                                        .format(scheduleDate),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(fontWeight: FontWeight.w300),
                                  ),
                                ],
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
                                const Text(' '),
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
                    if ([
                      OrderCardTargetPage.driverAccept,
                      OrderCardTargetPage.driverReceived,
                      OrderCardTargetPage.driverHistory,
                    ].contains(widget.orderCardTargetPage))
                      Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextButton(
                                  onPressed: () {
                                    context.router
                                        .push(ChefCustomerAddressRoute(
                                      id: '',
                                      isChef: false,
                                      address: Address(
                                        longitude:
                                            widget.order.addressLongitude,
                                        latitude: widget.order.addressLatitude,
                                        location: widget.order.location,
                                        name: widget.order.clientName ?? '',
                                        mobile: widget.order.clientMobile ?? '',
                                      ),
                                    ));
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/customer_icon.svg'),
                                      SizedBox(
                                          width: ThemeSelector
                                              .statics.defaultMicroGap),
                                      Expanded(
                                        child: Text(
                                          widget.order.clientName ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                      Text(
                                        S.of(context).view,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: TextButton(
                                  onPressed: () {
                                    context.router
                                        .push(ChefCustomerAddressRoute(
                                      id: widget.order.chefID ?? '',
                                      isChef: true,
                                    ));
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/welocme_chef_icon.svg',
                                        height: 15,
                                        colorFilter: ColorFilter.mode(
                                            ThemeSelector.colors.primary,
                                            BlendMode.srcIn),
                                      ),
                                      SizedBox(
                                          width: ThemeSelector
                                              .statics.defaultMicroGap),
                                      Expanded(
                                        child: Text(
                                          widget.order.chefName ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                      Text(
                                        S.of(context).view,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: ThemeSelector.statics.defaultGap),
                            ],
                          ),
                        ],
                      ),
                    if (widget.order.invoiceDetails!.isNotEmpty &&
                        ![
                          OrderCardTargetPage.driverAccept,
                          OrderCardTargetPage.driverReceived,
                          OrderCardTargetPage.driverHistory,
                        ].contains(widget.orderCardTargetPage))
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
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).invoiceTax,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        TextCurrency(
                          value: widget.order.invoiceTax ?? 0.0,
                          fontSize: ThemeSelector.fonts.font_14,
                        ),
                      ],
                    ),
                    if (widget.order.isPickUp != true)
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
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: constraints.maxWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // chef close order pickup
                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.chefReady &&
                              widget.order.isPickUp == true)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  String apiKey =
                                      widget.menuTarget == MenuTarget.order
                                          ? ApiKeys.orderChefPickUpDelivered
                                          : ApiKeys.preOrderChefPickUpDelivered;

                                  context.read<OrderBloc>().add(
                                        OrderEvent.putAction(
                                          order: widget.order,
                                          isFakeBody: false,
                                          navFun: widget.navFun,
                                          apiKey: ApiKeys.actionApiKeyString(
                                              apiKey: apiKey,
                                              id: '${widget.order.id}'),
                                          getApiKey: widget.getApiKey,
                                        ),
                                      );
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) => ThemeSelector.colors.success,
                                )),
                                child: Text(
                                  S.of(context).clientReceived,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color:
                                              ThemeSelector.colors.onSuccess),
                                ),
                              ),
                            ),

                          // chef finish order
                          if (widget.orderCardTargetPage ==
                              OrderCardTargetPage.chefPreparing)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  String apiKey = '';
                                  if (widget.menuTarget == MenuTarget.order) {
                                    apiKey = widget.order.isPickUp == true
                                        ? ApiKeys.orderChefPickUpFinished
                                        : ApiKeys.orderChefDeliveryFinished;
                                  } else {
                                    apiKey = widget.order.isPickUp == true
                                        ? ApiKeys.preOrderChefPickUpFinished
                                        : ApiKeys.preOrderChefDeliveryFinished;
                                  }

                                  context.read<OrderBloc>().add(
                                        OrderEvent.putAction(
                                          order: widget.order,
                                          navFun: widget.navFun,
                                          apiKey: ApiKeys.actionApiKeyString(
                                              apiKey: apiKey,
                                              id: '${widget.order.id}'),
                                          getApiKey: widget.getApiKey,
                                        ),
                                      );
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) => ThemeSelector.colors.success,
                                )),
                                child: Text(
                                  S.of(context).finish,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color:
                                              ThemeSelector.colors.onSuccess),
                                ),
                              ),
                            ),

                          // chef start order
                          if (widget.orderCardTargetPage ==
                              OrderCardTargetPage.chefReceived)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: widget.order.isPickUp != true &&
                                        widget.order.driverAccept != true
                                    ? null
                                    : () {
                                        String apiKey = '';
                                        if (widget.menuTarget ==
                                            MenuTarget.order) {
                                          apiKey = widget.order.isPickUp == true
                                              ? ApiKeys.orderChefPickUpStart
                                              : ApiKeys.orderChefDeliveryStart;
                                        } else {
                                          apiKey = widget.order.isPickUp == true
                                              ? ApiKeys.preOrderChefPickUpStart
                                              : ApiKeys
                                                  .preOrderChefDeliveryStart;
                                        }

                                        context.read<OrderBloc>().add(
                                              OrderEvent.putAction(
                                                order: widget.order,
                                                navFun: widget.navFun,
                                                apiKey:
                                                    ApiKeys.actionApiKeyString(
                                                        apiKey: apiKey,
                                                        id: '${widget.order.id}'),
                                                getApiKey: widget.getApiKey,
                                              ),
                                            );
                                      },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) => ThemeSelector.colors.primary
                                      .withAlpha(widget.order.isPickUp !=
                                                  true &&
                                              widget.order.driverAccept != true
                                          ? 100
                                          : 255),
                                )),
                                child: Row(
                                  children: [
                                    if (widget.order.isPickUp != true &&
                                        widget.order.driverAccept != true)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: ThemeSelector
                                                .statics.defaultMicroGap),
                                        child: SvgPicture.asset(
                                            'assets/images/waiting.svg'),
                                      ),
                                    Text(
                                      S.of(context).start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: ThemeSelector
                                                  .colors.onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          // chef accept preorder
                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.chefPending &&
                              widget.menuTarget == MenuTarget.preOrder)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: Row(
                                children: [
                                  TimerCount(
                                    menuTarget: widget.menuTarget,
                                    order: widget.order,
                                    isOver3hCount: true,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      String apiKey = widget.order.isPickUp ==
                                              true
                                          ? ApiKeys.preOrderChefPickUpAccept
                                          : ApiKeys.preOrderChefDeliveryAccept;

                                      context.read<OrderBloc>().add(
                                            OrderEvent.putAction(
                                              order: widget.order,
                                              navFun: widget.navFun,
                                              apiKey:
                                                  ApiKeys.actionApiKeyString(
                                                      apiKey: apiKey,
                                                      id: '${widget.order.id}'),
                                              getApiKey: widget.getApiKey,
                                            ),
                                          );
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateColor.resolveWith(
                                      (states) => ThemeSelector.colors.success,
                                    )),
                                    child: Text(
                                      S.of(context).accept,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: ThemeSelector
                                                  .colors.onSuccess),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          // driver close order delivery
                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.driverReceived &&
                              widget.order.driverReceived == true)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  String apiKey =
                                      widget.menuTarget == MenuTarget.order
                                          ? ApiKeys.orderDriverDelivered
                                          : ApiKeys.preOrderDriverDelivered;

                                  context.read<OrderBloc>().add(
                                        OrderEvent.putAction(
                                          order: widget.order,
                                          isFakeBody: false,
                                          navFun: widget.navFun,
                                          apiKey: ApiKeys.actionApiKeyString(
                                              apiKey: apiKey,
                                              id: '${widget.order.id}'),
                                          getApiKey: widget.getApiKey,
                                        ),
                                      );
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) => ThemeSelector.colors.success,
                                )),
                                child: Text(
                                  S.of(context).clientReceived,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color:
                                              ThemeSelector.colors.onSuccess),
                                ),
                              ),
                            ),

                          // driver received
                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.driverReceived &&
                              widget.order.driverReceived != true)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: widget.order.chefFinished != true
                                    ? null
                                    : () {
                                        context.read<OrderBloc>().add(
                                              OrderEvent.putAction(
                                                order: widget.order,
                                                navFun: widget.navFun,
                                                apiKey: ApiKeys.actionApiKeyString(
                                                    apiKey: widget.menuTarget ==
                                                            MenuTarget.order
                                                        ? ApiKeys
                                                            .orderDriverReceived
                                                        : ApiKeys
                                                            .preOrderDriverReceived,
                                                    id: '${widget.order.id}'),
                                                getApiKey: widget.getApiKey,
                                              ),
                                            );
                                      },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) => ThemeSelector.colors.primary
                                      .withAlpha(
                                          widget.order.chefFinished == true
                                              ? 255
                                              : 100),
                                )),
                                child: Row(
                                  children: [
                                    if (widget.order.chefFinished != true)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: ThemeSelector
                                                .statics.defaultMicroGap),
                                        child: SvgPicture.asset(
                                            'assets/images/waiting.svg'),
                                      ),
                                    Text(
                                      S.of(context).orderReceived,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: ThemeSelector
                                                  .colors.onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          // driver accept
                          if (widget.orderCardTargetPage ==
                              OrderCardTargetPage.driverAccept)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: Row(
                                children: [
                                  TimerCount(
                                      menuTarget: widget.menuTarget,
                                      order: widget.order),
                                  TextButton(
                                    onPressed: () {
                                      context.read<OrderBloc>().add(
                                            OrderEvent.putAction(
                                              order: widget.order,
                                              navFun: widget.navFun,
                                              apiKey: ApiKeys.actionApiKeyString(
                                                  apiKey: widget.menuTarget ==
                                                          MenuTarget.order
                                                      ? ApiKeys
                                                          .orderDriverAccept
                                                      : ApiKeys
                                                          .preOrderDriverAccept,
                                                  id: '${widget.order.id}'),
                                              getApiKey: widget.getApiKey,
                                            ),
                                          );
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateColor.resolveWith(
                                      (states) => ThemeSelector.colors.success,
                                    )),
                                    child: Text(
                                      S.of(context).accept,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: ThemeSelector
                                                  .colors.onSuccess),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          // customer order status
                          if ([
                            OrderCardTargetPage.customerHistory,
                            OrderCardTargetPage.customerOrders,
                            OrderCardTargetPage.customerPreOrders
                          ].contains(widget.orderCardTargetPage))
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  context.router.push(
                                      OrderStatusRoute(order: widget.order));
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) =>
                                      ThemeSelector.colors.backgroundTant,
                                )),
                                child: Text(
                                  S.of(context).orderStatus,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),

                          /// TODO: change api for preorder cancel
                          // customer cancel pre order
                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.customerPreOrders &&
                              widget.order.isOver12H &&
                              false)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  OrderService.putActionOrderOrPreOrder(
                                    apiKeys: ApiKeys.cancelChefOrder,
                                    orderId: widget.order.id,
                                  ).then((value) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage: S.of(context).orderCanceled,
                                      ),
                                    ));
                                  }).catchError((err) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage: err.response?.data['message'],
                                      ),
                                    ));
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) =>
                                      ThemeSelector.colors.backgroundTant,
                                )),
                                child: Text(
                                  S.of(context).cancel,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),

                          // wait & cancel driver
                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.customerHistory &&
                              widget.order.isDriverDelayed &&
                              widget.menuTarget == MenuTarget.order)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  OrderService.putActionOrderOrPreOrder(
                                    apiKeys: ApiKeys.waitDriverOrder,
                                    orderId: widget.order.id,
                                  ).then((value) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage:
                                            S.of(context).thankYouForWaiting,
                                      ),
                                    ));
                                  }).catchError((err) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage: err.response?.data['message'],
                                      ),
                                    ));
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) => ThemeSelector.colors.success,
                                )),
                                child: Text(
                                  S.of(context).wait,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color:
                                              ThemeSelector.colors.onSuccess),
                                ),
                              ),
                            ),

                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.customerHistory &&
                              widget.order.isDriverDelayed &&
                              widget.menuTarget == MenuTarget.order)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  OrderService.putActionOrderOrPreOrder(
                                    apiKeys: ApiKeys.cancelDriverOrder,
                                    orderId: widget.order.id,
                                  ).then((value) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage: S.of(context).orderCanceled,
                                      ),
                                    ));
                                  }).catchError((err) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage: err.response?.data['message'],
                                      ),
                                    ));
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) =>
                                      ThemeSelector.colors.backgroundTant,
                                )),
                                child: Text(
                                  S.of(context).cancel,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),

                          // wait & cancel chef
                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.customerHistory &&
                              widget.order.isChefDelayed &&
                              widget.menuTarget == MenuTarget.order)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  OrderService.putActionOrderOrPreOrder(
                                    apiKeys: ApiKeys.waitChefOrder,
                                    orderId: widget.order.id,
                                  ).then((value) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage:
                                            S.of(context).thankYouForWaiting,
                                      ),
                                    ));
                                  }).catchError((err) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage: err.response?.data['message'],
                                      ),
                                    ));
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) => ThemeSelector.colors.success,
                                )),
                                child: Text(
                                  S.of(context).wait,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color:
                                              ThemeSelector.colors.onSuccess),
                                ),
                              ),
                            ),

                          if (widget.orderCardTargetPage ==
                                  OrderCardTargetPage.customerHistory &&
                              widget.order.isChefDelayed &&
                              widget.menuTarget == MenuTarget.order)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  OrderService.putActionOrderOrPreOrder(
                                    apiKeys: ApiKeys.cancelChefOrder,
                                    orderId: widget.order.id,
                                  ).then((value) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage: S.of(context).orderCanceled,
                                      ),
                                    ));
                                  }).catchError((err) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: SnackBarMassage(
                                        massage: err.response?.data['message'],
                                      ),
                                    ));
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) =>
                                      ThemeSelector.colors.backgroundTant,
                                )),
                                child: Text(
                                  S.of(context).cancel,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),

                          if ((widget.order.invoiceDetails?.length ?? 0) > 1 &&
                              AppTarget.user != AppTargetUser.drivers)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.isView = !widget.isView;
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) =>
                                      ThemeSelector.colors.backgroundTant,
                                )),
                                child: Text(
                                  S.of(context).view,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),

                          if (AppTarget.user == AppTargetUser.drivers &&
                              widget.orderCardTargetPage !=
                                  OrderCardTargetPage.view)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ThemeSelector.statics.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    constraints:
                                        const BoxConstraints.tightFor(),
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
                                                color: ThemeSelector
                                                    .colors.background,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      ThemeSelector.statics
                                                          .defaultBlockGap),
                                                  topRight: Radius.circular(
                                                      ThemeSelector.statics
                                                          .defaultBlockGap),
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
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) =>
                                      ThemeSelector.colors.backgroundTant,
                                )),
                                child: Text(
                                  S.of(context).view,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
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
        if (widget.order.isLoading)
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(color: ThemeSelector.colors.shadow),
                child: Center(
                  child: Loading(),
                ),
              )),
      ],
    );
  }
}

class TimerCount extends StatefulWidget {
  TimerCount(
      {super.key,
      required this.menuTarget,
      required this.order,
      this.isOver3hCount = false});
  final Order order;
  final MenuTarget menuTarget;
  final bool isOver3hCount;
  late Timer timer;

  @override
  State<TimerCount> createState() => _TimerCountState();
}

class _TimerCountState extends State<TimerCount> {
  @override
  void initState() {
    /// TODO: worst thing ever X(
    /// this is for time count
    widget.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultMicroGap),
      child: Column(
        children: [
          SvgPicture.asset('assets/images/stop_watch_icon.svg'),
          Text(
            widget.isOver3hCount
                ? widget.order.isOver3HCount
                : widget.menuTarget == MenuTarget.order
                    ? widget.order.driverOrderPendingCount
                    : widget.order.driverPreOrderPendingCount,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
