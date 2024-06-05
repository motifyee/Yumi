import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/core/setup/signalr.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/review_model/review_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/service/order_service.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/review_chef_delivery.dart';

@RoutePage()
class OrderStatusScreen extends StatefulWidget {
  OrderStatusScreen({super.key, required this.order});

  Order order;

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime updatedDate =
        DateTime.tryParse(widget.order.updatedDate ?? '') ?? DateTime.now();
    DateTime? chefStartDate =
        DateTime.tryParse(widget.order.chefStartDate ?? '');
    DateTime? chefFinishedDate =
        DateTime.tryParse(widget.order.chefFinishedDate ?? '');
    DateTime? driverReceivedDate =
        DateTime.tryParse(widget.order.driverReceivedDate ?? '');
    DateTime? clientReceivedDate =
        DateTime.tryParse(widget.order.clientReceivedDate ?? '');

    return BlocConsumer<SignalRCubit, SignalRState>(
      listener: (context, state) async {
        if (state.isSignalTriggered(signal: [
          Signals.chefstart,
          Signals.cheffinished,
          Signals.driverreceived,
          Signals.clientreceived,
        ])) {
          OrderService.getOrderOrPreOrderDriverById(
                  apiKeys: '${ApiKeys.order}/', id: widget.order.id.toString())
              .then((e) => setState(() {
                    print(e.data);
                    widget.order = Order.fromJson(e.data[0]);
                  }));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: TextButton(
                onPressed: () {
                  context.router.popForced();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: ThemeSelector.colors.primary,
                )),
            title: Column(
              children: [
                Text(
                  S.of(context).orderStatus,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: ThemeSelector.fonts.font_16,
                      ),
                ),
                Text(
                  '${S.of(context).invoice}: #${widget.order.id}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.defaultBlockGap),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: SvgPicture.asset('assets/images/delivery_boy.svg')),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: ThemeSelector.statics.defaultGap),
                        Icon(
                          Icons.access_time_filled,
                          color: ThemeSelector.colors.primary.withAlpha(255),
                        ),
                        Container(
                          height: 75,
                          width: 5,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(),
                          child: Center(
                            child: CustomPaint(
                              painter: DrawDottedVerticalLine(
                                  height: 200,
                                  color: ThemeSelector.colors.primary
                                      .withAlpha(255)),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.map,
                          color: ThemeSelector.colors.primary.withAlpha(
                              widget.order.chefStart == true ? 255 : 100),
                        ),
                        Container(
                          height: 75,
                          width: 5,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(),
                          child: Center(
                            child: CustomPaint(
                              painter: DrawDottedVerticalLine(
                                  height: 200,
                                  color: ThemeSelector.colors.primary.withAlpha(
                                      widget.order.chefStart == true
                                          ? 255
                                          : 100)),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: ThemeSelector.colors.primary.withAlpha(
                              widget.order.driverReceived == true ||
                                      (widget.order.chefFinished == true &&
                                          widget.order.isPickUp == true)
                                  ? 255
                                  : 100),
                        ),
                        Container(
                          height: 75,
                          width: 5,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(),
                          child: Center(
                            child: CustomPaint(
                              painter: DrawDottedVerticalLine(
                                  height: 200,
                                  color: ThemeSelector.colors.primary.withAlpha(
                                      widget.order.driverReceived == true ||
                                              (widget.order.chefFinished ==
                                                      true &&
                                                  widget.order.isPickUp == true)
                                          ? 255
                                          : 100)),
                            ),
                          ),
                        ),
                        Container(
                          width: 21,
                          height: 21,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            color: ThemeSelector.colors.primary.withAlpha(
                                widget.order.clientReceived == true
                                    ? 255
                                    : 100),
                            borderRadius: BorderRadius.circular(
                                ThemeSelector.statics.defaultBlockGap),
                          ),
                          child: SvgPicture.asset(
                              'assets/images/client_received_icon.svg'),
                        ),
                      ],
                    ),
                    SizedBox(width: ThemeSelector.statics.defaultInputGap),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).orderReceived,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: ThemeSelector.colors.primary,
                                    size: ThemeSelector.fonts.font_14,
                                  ),
                                  const Text(' '),
                                  Text(
                                    DateFormat('d-M-yyyy | hh:mm')
                                        .format(updatedDate),
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 70,
                            width: 5,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(),
                            child: Center(
                              child: Container(),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).preparingOrder,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: ThemeSelector.colors.primary,
                                    size: ThemeSelector.fonts.font_14,
                                  ),
                                  const Text(' '),
                                  Text(
                                    widget.order.chefStart == true
                                        ? DateFormat('d-M-yyyy | hh:mm')
                                            .format(chefStartDate!)
                                        : '--:--',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 65,
                            width: 5,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(),
                            child: Center(
                              child: Container(),
                            ),
                          ),
                          if (widget.order.isPickUp != true)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(S.of(context).onTheWay,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: ThemeSelector.colors.primary,
                                      size: ThemeSelector.fonts.font_14,
                                    ),
                                    const Text(' '),
                                    Text(
                                      widget.order.driverReceived == true
                                          ? DateFormat('d-M-yyyy | hh:mm')
                                              .format(driverReceivedDate!)
                                          : '--:--',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                        ThemeSelector.statics.defaultMicroGap),
                                if (widget.order.driverReceived == true &&
                                    false)
                                  GestureDetector(
                                    onTap: () {
                                      context.router
                                          .push(const TrackingOrderRoute());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ThemeSelector.statics.defaultGap,
                                          vertical: ThemeSelector
                                              .statics.defaultMicroGap),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            ThemeSelector.statics
                                                .defaultBorderRadiusMedium),
                                        color: ThemeSelector.colors.primary,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            S.of(context).tracking,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                          SizedBox(
                                              width: ThemeSelector
                                                  .statics.defaultMicroGap),
                                          SvgPicture.asset(
                                              'assets/images/dot.svg')
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          if (widget.order.isPickUp == true)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(S.of(context).ready,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: ThemeSelector.colors.primary,
                                      size: ThemeSelector.fonts.font_14,
                                    ),
                                    const Text(' '),
                                    Text(
                                      widget.order.chefFinished == true
                                          ? DateFormat('d-M-yyyy | hh:mm')
                                              .format(chefFinishedDate!)
                                          : '--:--',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                        ThemeSelector.statics.defaultMicroGap),
                                if (widget.order.chefFinished == true)
                                  GestureDetector(
                                    onTap: () {
                                      context.router
                                          .push(ChefCustomerAddressRoute(
                                        id: widget.order.chefID ?? '',
                                        isChef: true,
                                      ));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ThemeSelector.statics.defaultGap,
                                          vertical: ThemeSelector
                                              .statics.defaultMicroGap),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            ThemeSelector.statics
                                                .defaultBorderRadiusMedium),
                                        color: ThemeSelector.colors.primary,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            S.of(context).chefAddress,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                          SizedBox(
                                              width: ThemeSelector
                                                  .statics.defaultMicroGap),
                                          SvgPicture.asset(
                                              'assets/images/dot.svg')
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          Container(
                            height: 65,
                            width: 5,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(),
                            child: Center(
                              child: Container(),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).clientReceived,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: ThemeSelector.colors.primary,
                                    size: ThemeSelector.fonts.font_14,
                                  ),
                                  const Text(' '),
                                  Text(
                                    widget.order.clientReceived == true
                                        ? DateFormat('d-M-yyyy | hh:mm')
                                            .format(clientReceivedDate!)
                                        : '--:--',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (widget.order.isClientReceivedOverDay)
                  Hero(
                    tag: 'ConfirmBasketSeries',
                    child: GestureDetector(
                      onTap: widget.order.clientReceived != true
                          ? null
                          : () {
                              showAdaptiveDialog(
                                useSafeArea: true,
                                context: context,
                                useRootNavigator: false,
                                builder: (context) => AlertDialog(
                                  scrollable: true,
                                  alignment: Alignment.center,
                                  backgroundColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent,
                                  insetPadding: EdgeInsets.zero,
                                  content: ReviewChefDriver(
                                    isChefOnly: widget.order.isPickUp == true
                                        ? true
                                        : false,
                                    reviewChef: const ReviewModel().copyWith(
                                      buddiesUserId: widget.order.chefID ?? '',
                                      code: CodeGenerator.getRandomCode(),
                                    ),
                                    reviewDriver: const ReviewModel().copyWith(
                                      buddiesUserId:
                                          widget.order.driverID ?? '',
                                      code: CodeGenerator.getRandomCode(),
                                    ),
                                  ),
                                ),
                              );
                            },
                      child: Container(
                        width: ThemeSelector.statics.defaultGapXXXL * 1.6,
                        height: ThemeSelector.statics.defaultTitleGapLarge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              ThemeSelector.statics.defaultBorderRadius),
                          color: ThemeSelector.colors.primary.withAlpha(
                              widget.order.clientReceived != true ? 100 : 255),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).rateOrder,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DrawDottedVerticalLine extends CustomPainter {
  late Paint _paint;
  double height;

  DrawDottedVerticalLine({required this.height, required Color color}) {
    _paint = Paint();
    _paint.color = color; //dots color
    _paint.strokeWidth = 4; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -height; i < height; i = i + 5) {
      // 15 is space between dots
      if (i % 3 == 0) {
        canvas.drawLine(Offset(0.0, i), Offset(0.0, i + 5), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}