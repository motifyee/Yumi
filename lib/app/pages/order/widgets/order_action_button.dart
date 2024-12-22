import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:yumi/app/pages/order/widgets/order_card.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';
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
      padding:
          const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
      child: TextButton(
        onPressed: () {
          if (config.disabled) return;

          if (config.onPressed != null) {
            config.onPressed!();
            return;
          }

          context.read<OrderCubit>().putAction(
                order: config.order,
                apiKey: Endpoints.actionApiKeyString(
                  apiKey: config.apiKey,
                  id: '${config.order.id}',
                ),
                getApiKey: config.getApiKey,
                isFakeBody: config.isFakeBody,
                navFun: config.navFun,
                customMessage: config.customMessage,
              );
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => config.backGroundColor ?? CommonColors.backgroundTant,
          ),
        ),
        child: Row(
          children: [
            if (config.isWaiting)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonDimens.defaultMicroGap,
                ),
                child: SvgPicture.asset('assets/images/waiting.svg'),
              ),
            Text(
              config.text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: config.color ?? CommonColors.secondary),
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
    this.disabled = false,
    this.navFun,
    this.onPressed,
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
  final bool disabled;
  final Function()? navFun;
  final Function()? onPressed;
  final Color? backGroundColor;
  final Color? color;
  final String text;
  final bool isWaiting;
  final String? customMessage;
}

class OrderPutActions {
  static chefCloseOrderPickup({required OrderCard widget}) =>
      OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? Endpoints().orderChefPickUpDelivered
            : Endpoints().preOrderChefPickUpDelivered,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: false,
        navFun: widget.navFun,
        text: S.current.clientReceived,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static chefFinishOrder({required OrderCard widget}) => OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? widget.order.isPickUp == true
                ? Endpoints().orderChefPickUpFinished
                : Endpoints().orderChefDeliveryFinished
            : widget.order.isPickUp == true
                ? Endpoints().preOrderChefPickUpFinished
                : Endpoints().preOrderChefDeliveryFinished,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.finish,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static chefStartOrder({required OrderCard widget}) => OrderPutActionConfig(
        disabled: widget.order.isPickUp == false &&
            widget.order.driverAccept == false,
        apiKey: widget.menuTarget == MenuTarget.order
            ? widget.order.isPickUp == true
                ? Endpoints().orderChefPickUpStart
                : Endpoints().orderChefDeliveryStart
            : widget.order.isPickUp == true
                ? Endpoints().preOrderChefPickUpStart
                : Endpoints().preOrderChefDeliveryStart,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.start,
        backGroundColor: CommonColors.primary.withAlpha(
          widget.order.isPickUp == false && widget.order.driverAccept == false
              ? 100
              : 255,
        ),
        color: CommonColors.onPrimary,
        isWaiting:
            widget.order.isPickUp != true && widget.order.driverAccept != true,
      );

  static chefCancelPreOrder({required OrderCard widget}) =>
      OrderPutActionConfig(
        apiKey: (widget.order).isPickUp == true
            ? Endpoints().preorderCancelChefPickup
            : Endpoints().preorderCancelChefDelivery,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.cancel,
        customMessage: S.current.orderCanceled,
      );

  static chefAcceptPreorder({required OrderCard widget}) =>
      OrderPutActionConfig(
        disabled: widget.order.isPickUp == false &&
            widget.order.driverAccept == false,
        apiKey: widget.order.isPickUp == true
            ? Endpoints().preOrderChefPickUpAccept
            : Endpoints().preOrderChefDeliveryAccept,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.accept,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static driverCloseOrderDelivery({required OrderCard widget}) =>
      OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? Endpoints().orderDriverDelivered
            : Endpoints().preOrderDriverDelivered,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.clientReceived,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static driverReceived({required OrderCard widget}) => OrderPutActionConfig(
        disabled: widget.order.chefFinished == false,
        apiKey: widget.menuTarget == MenuTarget.order
            ? Endpoints().orderDriverReceived
            : Endpoints().preOrderDriverReceived,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.orderReceived,
        backGroundColor: CommonColors.primary
            .withAlpha(widget.order.chefFinished == true ? 255 : 100),
        color: CommonColors.onPrimary,
        isWaiting: widget.order.chefFinished != true,
      );

  static driverAccept({required OrderCard widget}) => OrderPutActionConfig(
        apiKey: widget.menuTarget == MenuTarget.order
            ? Endpoints().orderDriverAccept
            : Endpoints().preOrderDriverAccept,
        getApiKey: widget.getApiKey,
        order: widget.order,
        isFakeBody: true,
        navFun: widget.navFun,
        text: S.current.accept,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
      );

  static customerOrderStatus({required OrderCard widget}) =>
      OrderPutActionConfig(
        apiKey: '',
        getApiKey: '',
        order: widget.order,
        text: S.current.orderStatus,
        onPressed: () =>
            G().context.router.push(OrderStatusRoute(order: widget.order)),
      );

  static waitDriver({required OrderCard widget}) => OrderPutActionConfig(
        apiKey: Endpoints().waitDriverOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.wait,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
        customMessage: S.current.thankYouForWaiting,
      );

  static cancelDriver({required OrderCard widget}) => OrderPutActionConfig(
        apiKey: Endpoints().cancelDriverOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.cancel,
        customMessage: S.current.orderCanceled,
      );

  static waitChef({required OrderCard widget}) => OrderPutActionConfig(
        apiKey: Endpoints().waitChefOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.wait,
        backGroundColor: CommonColors.success,
        color: CommonColors.onSuccess,
        customMessage: S.current.thankYouForWaiting,
      );

  static cancelChef({required OrderCard widget}) => OrderPutActionConfig(
        apiKey: Endpoints().cancelChefOrder,
        order: widget.order,
        getApiKey: widget.getApiKey,
        text: S.current.cancel,
        customMessage: S.current.orderCanceled,
      );
}
