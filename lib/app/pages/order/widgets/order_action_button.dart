import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';

class PutActionButton extends StatelessWidget {
  PutActionButton({
    super.key,
    required this.config,
  });

  final OrderPutActionConfig config;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultMicroGap),
      child: TextButton(
        onPressed: config.cannotPress
            ? null
            : config.customFun ??
                () {
                  context.read<OrderCubit>().putAction(
                      order: config.order,
                      apiKey: ApiKeys.actionApiKeyString(
                          apiKey: config.apiKey, id: '${config.order.id}'),
                      getApiKey: config.getApiKey,
                      isFakeBody: config.isFakeBody,
                      navFun: config.navFun,
                      customMessage: config.customMessage);
                },
        style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
          (states) =>
              config.backGroundColor ?? ThemeSelector.colors.backgroundTant,
        )),
        child: Row(
          children: [
            if (config.isWaiting)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultMicroGap),
                child: SvgPicture.asset('assets/images/waiting.svg'),
              ),
            Text(
              config.text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: config.color ?? ThemeSelector.colors.secondary),
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
    this.cannotPress = true,
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
  static chefCloseOrderPickup({required dynamic widget}) =>
      OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? ApiKeys.orderChefPickUpDelivered
            : ApiKeys.preOrderChefPickUpDelivered,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: false,
        navFun: widget.navFun,
        text: S.current.clientReceived,
        backGroundColor: ThemeSelector.colors.success,
        color: ThemeSelector.colors.onSuccess,
      );

  static chefFinishOrder({required dynamic widget}) => OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? widget.order.isPickUp == true
                ? ApiKeys.orderChefPickUpFinished
                : ApiKeys.orderChefDeliveryFinished
            : widget.order.isPickUp == true
                ? ApiKeys.preOrderChefPickUpFinished
                : ApiKeys.preOrderChefDeliveryFinished,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.finish,
        backGroundColor: ThemeSelector.colors.success,
        color: ThemeSelector.colors.onSuccess,
      );

  static chefStartOrder({required dynamic widget}) => OrderPutActionConfig(
        cannotPress:
            widget.order.isPickUp != true && widget.order.driverAccept != true,
        apiKey: widget.menuTarget == MenuTarget.order
            ? widget.order.isPickUp == true
                ? ApiKeys.orderChefPickUpStart
                : ApiKeys.orderChefDeliveryStart
            : widget.order.isPickUp == true
                ? ApiKeys.preOrderChefPickUpStart
                : ApiKeys.preOrderChefDeliveryStart,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.start,
        backGroundColor: ThemeSelector.colors.primary.withAlpha(
            widget.order.isPickUp != true && widget.order.driverAccept != true
                ? 100
                : 255),
        color: ThemeSelector.colors.onPrimary,
        isWaiting:
            widget.order.isPickUp != true && widget.order.driverAccept != true,
      );

  static chefAcceptPreorder({required dynamic widget}) => OrderPutActionConfig(
        cannotPress:
            widget.order.isPickUp != true && widget.order.driverAccept != true,
        apiKey: widget.order.isPickUp == true
            ? ApiKeys.preOrderChefPickUpAccept
            : ApiKeys.preOrderChefDeliveryAccept,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.accept,
        backGroundColor: ThemeSelector.colors.success,
        color: ThemeSelector.colors.onSuccess,
      );

  static driverCloseOrderDelivery({required dynamic widget}) =>
      OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? ApiKeys.orderDriverDelivered
            : ApiKeys.preOrderDriverDelivered,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.clientReceived,
        backGroundColor: ThemeSelector.colors.success,
        color: ThemeSelector.colors.onSuccess,
      );

  static driverReceived({required dynamic widget}) => OrderPutActionConfig(
        cannotPress: widget.order.chefFinished != true,
        apiKey: widget.menuTarget == MenuTarget.order
            ? ApiKeys.orderDriverReceived
            : ApiKeys.preOrderDriverReceived,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.orderReceived,
        backGroundColor: ThemeSelector.colors.primary
            .withAlpha(widget.order.chefFinished == true ? 255 : 100),
        color: ThemeSelector.colors.onPrimary,
        isWaiting: widget.order.chefFinished != true,
      );

  static driverAccept({required dynamic widget}) => OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? ApiKeys.orderDriverAccept
            : ApiKeys.preOrderDriverAccept,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.accept,
        backGroundColor: ThemeSelector.colors.success,
        color: ThemeSelector.colors.onSuccess,
      );

  static customerOrderStatus({required dynamic widget}) => OrderPutActionConfig(
        apiKey: '',
        getApiKey: '',
        order: widget.order,
        text: S.current.orderStatus,
        customFun: () =>
            G.context.router.push(OrderStatusRoute(order: widget.order)),
      );

  static waitDriver({required dynamic widget}) => OrderPutActionConfig(
        apiKey: ApiKeys.waitDriverOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.wait,
        backGroundColor: ThemeSelector.colors.success,
        color: ThemeSelector.colors.onSuccess,
        customMessage: S.current.thankYouForWaiting,
      );

  static cancelDriver({required dynamic widget}) => OrderPutActionConfig(
        apiKey: ApiKeys.cancelDriverOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.cancel,
        customMessage: S.current.orderCanceled,
      );

  static waitChef({required dynamic widget}) => OrderPutActionConfig(
        apiKey: ApiKeys.waitChefOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.wait,
        backGroundColor: ThemeSelector.colors.success,
        color: ThemeSelector.colors.onSuccess,
        customMessage: S.current.thankYouForWaiting,
      );

  static cancelChef({required dynamic widget}) => OrderPutActionConfig(
        apiKey: ApiKeys.cancelChefOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.cancel,
        customMessage: S.current.orderCanceled,
      );
}
