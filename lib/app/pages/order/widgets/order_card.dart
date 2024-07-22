import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:common_code/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/order/widgets/order_action_button.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/domain/order/use_case/get_order_preorder_driver_by_id.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/pages/order/widgets/product_in_card.dart';

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
  getOrderForView() async {
    final task = await GetOrderPreorderDriverById().call(GetOrderPreorderDriverByIdParams(apiKeys: EndPoints.orderDriverAvailableById, id: widget.order.id.toString()));
    task.fold((l) => null, (r) => widget.order = widget.order.copyWith(invoiceDetails: r.invoiceDetails));
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

    if ((widget.order.invoiceDetails?.length ?? 0) < 2 || AppTarget.user == YumiApp.drivers) {
      widget.isView = true;
    }

    if (widget.orderCardTargetPage == OrderCardTargetPage.driverAccept) {
      if (widget.menuTarget == MenuTarget.order && widget.order.isDriverOrderPendingEnd) {
        return const SizedBox(height: 0, width: 0);
      }
      if (widget.menuTarget == MenuTarget.preOrder && widget.order.isDriverPreOrderPendingEnd) {
        return const SizedBox(height: 0, width: 0);
      }
    }

    if (widget.orderCardTargetPage == OrderCardTargetPage.chefPending && widget.menuTarget == MenuTarget.preOrder) {
      if (widget.order.isOver3H) return const SizedBox(height: 0, width: 0);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: CommonDimens.defaultTitleGap / 4),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonDimens.defaultBlockGap,
                  vertical: CommonDimens.defaultTitleGap,
                ),
                margin: const EdgeInsets.only(top: CommonDimens.defaultTitleGap / 2),
                decoration: BoxDecoration(
                  color: CommonColors.onPrimary,
                  boxShadow: [
                    BoxShadow(
                      color: CommonColors.secondaryFaint.withOpacity(.3),
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
                                DateFormat('d-M-yyyy | hh:mm').format(updatedDate),
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300),
                              ),
                          ],
                        ),
                        if (scheduleDate != null)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: CommonDimens.defaultMicroGap),
                                child: SvgPicture.asset(
                                  'assets/images/schedule_icon.svg',
                                  height: 28,
                                ),
                              ),
                              const SizedBox(width: CommonDimens.defaultMicroGap),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${S.of(context).scheduleDate}:',
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                  Text(
                                    DateFormat('d-M-yyyy | hh:mm').format(scheduleDate),
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if (AppTarget.user != YumiApp.drivers)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultGap,
                              vertical: CommonDimens.defaultMicroGap,
                            ),
                            decoration: BoxDecoration(color: CommonColors.backgroundTant, borderRadius: BorderRadius.circular(CommonDimens.defaultBorderRadiusMedium)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(widget.order.isPickUp == true ? 'assets/images/pickup_icon.svg' : 'assets/images/delivery_icon.svg'),
                                const Text(' '),
                                Text(widget.order.isPickUp == true ? S.of(context).pickup : S.of(context).delivery)
                              ],
                            ),
                          ),
                        if (AppTarget.user == YumiApp.drivers)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultGap,
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
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: SnackBarMassage(
                                            massage: S.of(context).noAccessToDailSystem,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: CommonDimens.defaultBlockGap,
                                    height: CommonDimens.defaultBlockGap,
                                    padding: const EdgeInsets.all(CommonDimens.defaultMicroGap),
                                    decoration: BoxDecoration(color: CommonColors.primary, borderRadius: BorderRadius.circular(CommonDimens.defaultBlockGap)),
                                    child: SvgPicture.asset('assets/images/calling.svg'),
                                  ),
                                ),
                                const SizedBox(width: CommonDimens.defaultInputGap),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: CommonDimens.defaultBlockGap,
                                    height: CommonDimens.defaultBlockGap,
                                    padding: const EdgeInsets.all(CommonDimens.defaultMicroGap),
                                    decoration: BoxDecoration(color: CommonColors.primary, borderRadius: BorderRadius.circular(CommonDimens.defaultBlockGap)),
                                    child: SvgPicture.asset('assets/images/chat.svg'),
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
                          const SizedBox(height: CommonDimens.defaultGap),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/label_yellow.svg'),
                              const SizedBox(
                                width: CommonDimens.defaultGap,
                              ),
                              Text(
                                S.of(context).clickTheIconToViewCustomerNotes,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: CommonFontSize.font_10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: CommonDimens.defaultGap),
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
                                    context.router.push(ChefCustomerAddressRoute(
                                      id: '',
                                      isChef: false,
                                      address: Address(
                                        longitude: widget.order.addressLongitude,
                                        latitude: widget.order.addressLatitude,
                                        location: widget.order.location,
                                        name: widget.order.clientName ?? '',
                                        mobile: widget.order.clientMobile ?? '',
                                      ),
                                    ));
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/images/customer_icon.svg'),
                                      const SizedBox(width: CommonDimens.defaultMicroGap),
                                      Expanded(
                                        child: Text(
                                          widget.order.clientName ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                      ),
                                      Text(
                                        S.of(context).view,
                                        style: Theme.of(context).textTheme.headlineMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: TextButton(
                                  onPressed: () {
                                    context.router.push(ChefCustomerAddressRoute(
                                      id: widget.order.chefID ?? '',
                                      isChef: true,
                                    ));
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/welocme_chef_icon.svg',
                                        height: 15,
                                        colorFilter: ColorFilter.mode(CommonColors.primary, BlendMode.srcIn),
                                      ),
                                      const SizedBox(width: CommonDimens.defaultMicroGap),
                                      Expanded(
                                        child: Text(
                                          widget.order.chefName ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                      ),
                                      Text(
                                        S.of(context).view,
                                        style: Theme.of(context).textTheme.headlineMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: CommonDimens.defaultGap),
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
                          duration: CommonDimens.animationDuration,
                          child: SizedBox(
                            height: widget.isView ? (widget.order.invoiceDetails?.length ?? 0) * 55 : 50,
                            width: constraints.maxWidth,
                            child: Stack(
                              children: [
                                AnimatedSize(
                                  duration: CommonDimens.animationDuration,
                                  child: SizedBox(
                                    height: widget.isView ? (widget.order.invoiceDetails?.length ?? 0) * 55 : 50,
                                    width: constraints.maxWidth,
                                  ),
                                ),
                                for (var i = 0; i < (widget.order.invoiceDetails?.length ?? 0); i++)
                                  AnimatedPositioned(
                                    left: widget.isView ? 0.0 : 30.0 * i,
                                    top: widget.isView ? 55.0 * i : 0.0,
                                    width: widget.isView ? constraints.maxWidth : 50,
                                    duration: CommonDimens.animationDuration,
                                    child: ProductInCard(
                                      isView: widget.isView,
                                      maxWidth: constraints.maxWidth,
                                      invoiceDetails: widget.order.invoiceDetails![i],
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: CommonDimens.defaultGap),
                    if ((widget.order.invoiceDiscount ?? 0) > 0)
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).discount,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          TextCurrency(
                            value: widget.order.invoiceDiscount ?? 0.0,
                            fontSize: CommonFontSize.font_14,
                          ),
                        ],
                      ),
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
                          fontSize: CommonFontSize.font_14,
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
                            fontSize: CommonFontSize.font_14,
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).theTotalPriceIncludesTax,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: CommonDimens.defaultGap),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).total,
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontSize: CommonFontSize.font_16,
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
                padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultGap),
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // chef close order pickup
                          if (widget.orderCardTargetPage == OrderCardTargetPage.chefReady && widget.order.isPickUp == true) PutActionButton(config: OrderPutActions.chefCloseOrderPickup(widget: widget)),

                          // chef finish order
                          if (widget.orderCardTargetPage == OrderCardTargetPage.chefPreparing) PutActionButton(config: OrderPutActions.chefFinishOrder(widget: widget)),

                          // chef start order
                          if (widget.orderCardTargetPage == OrderCardTargetPage.chefReceived) PutActionButton(config: OrderPutActions.chefStartOrder(widget: widget)),

                          // chef accept preorder
                          if (widget.orderCardTargetPage == OrderCardTargetPage.chefPending && widget.menuTarget == MenuTarget.preOrder)
                            Row(
                              children: [
                                TimerCount(
                                  menuTarget: widget.menuTarget,
                                  order: widget.order,
                                  isOver3hCount: true,
                                ),
                                PutActionButton(config: OrderPutActions.chefAcceptPreorder(widget: widget)),
                              ],
                            ),

                          // driver close order delivery
                          if (widget.orderCardTargetPage == OrderCardTargetPage.driverReceived && widget.order.driverReceived == true) PutActionButton(config: OrderPutActions.driverCloseOrderDelivery(widget: widget)),

                          // driver received
                          if (widget.orderCardTargetPage == OrderCardTargetPage.driverReceived && widget.order.driverReceived != true) PutActionButton(config: OrderPutActions.driverReceived(widget: widget)),

                          // driver accept
                          if (widget.orderCardTargetPage == OrderCardTargetPage.driverAccept)
                            Row(
                              children: [
                                TimerCount(menuTarget: widget.menuTarget, order: widget.order),
                                PutActionButton(config: OrderPutActions.driverAccept(widget: widget)),
                              ],
                            ),

                          // customer order status
                          if ([OrderCardTargetPage.customerHistory, OrderCardTargetPage.customerOrders, OrderCardTargetPage.customerPreOrders].contains(widget.orderCardTargetPage))
                            PutActionButton(config: OrderPutActions.customerOrderStatus(widget: widget)),

                          /// TODO: change api for preorder cancel
                          // customer cancel pre order
                          // if (widget.orderCardTargetPage ==
                          //         OrderCardTargetPage.customerPreOrders &&
                          //     widget.order.isOver12H &&
                          //     false)
                          //   Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: CommonDimens.defaultMicroGap),
                          //     child: TextButton(
                          //       onPressed: () {
                          //         OrderService.putActionOrderOrPreOrder(
                          //           apiKeys: EndPoints.cancelChefOrder,
                          //           orderId: widget.order.id,
                          //         ).then((value) {
                          //           ScaffoldMessenger.of(context)
                          //               .showSnackBar(SnackBar(
                          //             content: SnackBarMassage(
                          //               massage: S.of(context).orderCanceled,
                          //             ),
                          //           ));
                          //         }).catchError((err) {
                          //           ScaffoldMessenger.of(context)
                          //               .showSnackBar(SnackBar(
                          //             content: SnackBarMassage(
                          //               massage: err.response?.data['message'],
                          //             ),
                          //           ));
                          //         });
                          //       },
                          //       style: ButtonStyle(
                          //           backgroundColor:
                          //               WidgetStateColor.resolveWith(
                          //         (states) => CommonColors.backgroundTant,
                          //       )),
                          //       child: Text(
                          //         S.of(context).cancel,
                          //         style: Theme.of(context).textTheme.bodyMedium,
                          //       ),
                          //     ),
                          //   ),

                          // wait & cancel driver
                          if (widget.orderCardTargetPage == OrderCardTargetPage.customerHistory && widget.order.isDriverDelayed && widget.menuTarget == MenuTarget.order)
                            Row(
                              children: [
                                PutActionButton(config: OrderPutActions.waitDriver(widget: widget)),
                                PutActionButton(config: OrderPutActions.cancelDriver(widget: widget)),
                              ],
                            ),

                          // wait & cancel chef
                          if (widget.orderCardTargetPage == OrderCardTargetPage.customerHistory && widget.order.isChefDelayed && widget.menuTarget == MenuTarget.order)
                            Row(
                              children: [
                                PutActionButton(config: OrderPutActions.waitChef(widget: widget)),
                                PutActionButton(config: OrderPutActions.cancelChef(widget: widget)),
                              ],
                            ),

                          if ((widget.order.invoiceDetails?.length ?? 0) > 1 && AppTarget.user != YumiApp.drivers)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.isView = !widget.isView;
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateColor.resolveWith(
                                  (states) => CommonColors.backgroundTant,
                                )),
                                child: Text(
                                  S.of(context).view,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),

                          if (AppTarget.user == YumiApp.drivers && widget.orderCardTargetPage != OrderCardTargetPage.view)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
                              child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    constraints: const BoxConstraints.tightFor(),
                                    context: context,
                                    builder: (context) => SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultBlockGap),
                                            decoration: BoxDecoration(
                                                color: CommonColors.background,
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(CommonDimens.defaultBlockGap),
                                                  topRight: Radius.circular(CommonDimens.defaultBlockGap),
                                                )),
                                            child: OrderCard(
                                              menuTarget: widget.menuTarget,
                                              getApiKey: widget.getApiKey,
                                              orderCardTargetPage: OrderCardTargetPage.view,
                                              order: widget.order,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateColor.resolveWith(
                                  (states) => CommonColors.backgroundTant,
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
          left: CommonDimens.defaultGap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: CommonDimens.defaultGap,
              horizontal: CommonDimens.defaultBlockGap,
            ),
            decoration: BoxDecoration(
              color: CommonColors.primary,
              borderRadius: BorderRadius.circular(CommonDimens.defaultBorderRadiusMedium),
            ),
            child: Text(
              S.of(context).orderReceived,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w500),
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
                decoration: BoxDecoration(color: CommonColors.shadow),
                child: const Center(
                  child: Loading(),
                ),
              )),
      ],
    );
  }
}

class TimerCount extends StatefulWidget {
  TimerCount({super.key, required this.menuTarget, required this.order, this.isOver3hCount = false});
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
      padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
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
