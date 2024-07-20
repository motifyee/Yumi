import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:common_code/common_code.dart';

class PutActionButton extends StatelessWidget {
  const PutActionButton({
    super.key,
    required this.config,
  });

  final OrderPutActionConfig config;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
      child: TextButton(
        onPressed: config.cannotPress
            ? null
            : config.customFun ??
                () {
                  context.read<OrderCubit>().putAction(
                      order: config.order, apiKey: EndPoints.actionApiKeyString(apiKey: config.apiKey, id: '${config.order.id}'), getApiKey: config.getApiKey, isFakeBody: config.isFakeBody, navFun: config.navFun, customMessage: config.customMessage);
                },
        style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
          (states) => config.backGroundColor ?? CommonColors.backgroundTant,
        )),
        child: Row(
          children: [
            if (config.isWaiting)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
                child: SvgPicture.asset('assets/images/waiting.svg'),
              ),
            Text(
              config.text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: config.color ?? CommonColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPutActionConfig {
  OrderPutActionConfig({
    required this.apiKey,
    required this.getApiKey,
    required this.order,
    this.isFakeBody = true,
    this.cannotPress = false,
    this.navFun,
    this.customFun,
    this.backGroundColor,
    this.color,
    required this.text,
    this.isWaiting = false,
    this.customMessage,
  });

  final String apiKey;
  final String getApiKey;
  final Order order;
  final bool isFakeBody;
  final bool cannotPress;
  final Function()? navFun;
  final Function()? customFun;
  final Color? backGroundColor;
  final Color? color;
  final String text;
  final bool isWaiting;
  final String? customMessage;
}

class OrderPutActions {
  static chefCloseOrderPickup({required dynamic widget}) => OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order ? EndPoints.orderChefPickUpDelivered : EndPoints.preOrderChefPickUpDelivered,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: false,
        navFun: widget.navFun,
        text: S.current.clientReceived,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static chefFinishOrder({required dynamic widget}) => OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? widget.order.isPickUp == true
                ? EndPoints.orderChefPickUpFinished
                : EndPoints.orderChefDeliveryFinished
            : widget.order.isPickUp == true
                ? EndPoints.preOrderChefPickUpFinished
                : EndPoints.preOrderChefDeliveryFinished,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.finish,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static chefStartOrder({required dynamic widget}) => OrderPutActionConfig(
        cannotPress: widget.order.isPickUp != true && widget.order.driverAccept != true,
        apiKey: widget.menuTarget == MenuTarget.order
            ? widget.order.isPickUp == true
                ? EndPoints.orderChefPickUpStart
                : EndPoints.orderChefDeliveryStart
            : widget.order.isPickUp == true
                ? EndPoints.preOrderChefPickUpStart
                : EndPoints.preOrderChefDeliveryStart,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.start,
        backGroundColor: CommonColors.primary.withAlpha(widget.order.isPickUp != true && widget.order.driverAccept != true ? 100 : 255),
        color: CommonColors.onPrimary,
        isWaiting: widget.order.isPickUp != true && widget.order.driverAccept != true,
      );

  static chefAcceptPreorder({required dynamic widget}) => OrderPutActionConfig(
        cannotPress: widget.order.isPickUp != true && widget.order.driverAccept != true,
        apiKey: widget.order.isPickUp == true ? EndPoints.preOrderChefPickUpAccept : EndPoints.preOrderChefDeliveryAccept,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.accept,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static driverCloseOrderDelivery({required dynamic widget}) => OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order ? EndPoints.orderDriverDelivered : EndPoints.preOrderDriverDelivered,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.clientReceived,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static driverReceived({required dynamic widget}) => OrderPutActionConfig(
        cannotPress: widget.order.chefFinished != true,
        apiKey: widget.menuTarget == MenuTarget.order ? EndPoints.orderDriverReceived : EndPoints.preOrderDriverReceived,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.orderReceived,
        backGroundColor: CommonColors.primary.withAlpha(widget.order.chefFinished == true ? 255 : 100),
        color: CommonColors.onPrimary,
        isWaiting: widget.order.chefFinished != true,
      );

  static driverAccept({required dynamic widget}) => OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order ? EndPoints.orderDriverAccept : EndPoints.preOrderDriverAccept,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.accept,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static customerOrderStatus({required dynamic widget}) => OrderPutActionConfig(
        apiKey: '',
        getApiKey: '',
        order: widget.order,
        text: S.current.orderStatus,
        customFun: () => G().context.router.push(OrderStatusRoute(order: widget.order)),
      );

  static waitDriver({required dynamic widget}) => OrderPutActionConfig(
        apiKey: EndPoints.waitDriverOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.wait,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
        customMessage: S.current.thankYouForWaiting,
      );

  static cancelDriver({required dynamic widget}) => OrderPutActionConfig(
        apiKey: EndPoints.cancelDriverOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.cancel,
        customMessage: S.current.orderCanceled,
      );

  static waitChef({required dynamic widget}) => OrderPutActionConfig(
        apiKey: EndPoints.waitChefOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.wait,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
        customMessage: S.current.thankYouForWaiting,
      );

  static cancelChef({required dynamic widget}) => OrderPutActionConfig(
        apiKey: EndPoints.cancelChefOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.cancel,
        customMessage: S.current.orderCanceled,
      );
}
