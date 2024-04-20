import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/model/review_model/review_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/review_chef_delivery.dart';

@RoutePage()
class OrderStatusScreen extends StatelessWidget {
  OrderStatusScreen({super.key, required this.order});

  OrderModel order;

  @override
  Widget build(BuildContext context) {
    print('order ............................');
    print(order);

    DateTime? _driverAcceptDate =
        DateTime.tryParse(order.driverAcceptDate ?? '');
    DateTime? _chefStartDate = DateTime.tryParse(order.chefStartDate ?? '');
    DateTime? _driverReceivedDate =
        DateTime.tryParse(order.driverReceivedDate ?? '');

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
              '${S.of(context).invoice}: #${order.id}',
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
            Center(child: SvgPicture.asset('assets/images/delivery_boy.svg')),
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
                      color: ThemeSelector.colors.primary
                          .withAlpha(order.driverAccept == true ? 255 : 100),
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
                                  order.driverAccept == true ? 255 : 100)),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.map,
                      color: ThemeSelector.colors.primary
                          .withAlpha(order.chefStart == true ? 255 : 100),
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
                                  order.chefStart == true ? 255 : 100)),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: ThemeSelector.colors.primary
                          .withAlpha(order.driverReceived == true ? 255 : 100),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).orderReceived,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              if (order.driverAccept == true)
                                Text('05:00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: ThemeSelector
                                                .colors.secondaryTantLighter)),
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
                                order.driverAccept == true
                                    ? DateFormat('hh:mm a, d MMM yyyy')
                                        .format(_driverAcceptDate!)
                                    : '--:--',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).preparingOrder,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              if (order.chefStart == true)
                                Text('05:00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: ThemeSelector
                                                .colors.secondaryTantLighter)),
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
                                order.chefStart == true
                                    ? DateFormat('hh:mm a, d MMM yyyy')
                                        .format(_chefStartDate!)
                                    : '08:04 AM, 10 Nov 2023',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).onTheWay,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              if (order.driverReceived == true)
                                Text('05:00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: ThemeSelector
                                                .colors.secondaryTantLighter)),
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
                                order.driverReceived == true
                                    ? DateFormat('hh:mm a, d MMM yyyy')
                                        .format(_driverReceivedDate!)
                                    : '--:--',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                          if (order.driverReceived == true)
                            GestureDetector(
                              onTap: () {
                                context.router.push(const TrackingOrderRoute());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ThemeSelector.statics.defaultGap,
                                    vertical:
                                        ThemeSelector.statics.defaultMicroGap),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ThemeSelector
                                          .statics.defaultBorderRadiusMedium),
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
                                    SvgPicture.asset('assets/images/dot.svg')
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Hero(
              tag: 'ConfirmBasketSeries',
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    useSafeArea: true,
                    context: context,
                    builder: (context) => AlertDialog(
                        scrollable: true,
                        alignment: Alignment.center,
                        backgroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        insetPadding: EdgeInsets.zero,
                        content: ReviewChefDriver(
                          isChefOnly: false,
                          reviewChef: const ReviewModel().copyWith(
                            buddiesUserId: order.chefID ?? '',
                            code: CodeGenerator.getRandomCode(),
                          ),
                          reviewDriver: const ReviewModel().copyWith(
                            buddiesUserId: order.driverID ?? '',
                            code: CodeGenerator.getRandomCode(),
                          ),
                        )),
                  );
                },
                child: Container(
                  width: ThemeSelector.statics.defaultGapXXXL * 1.6,
                  height: ThemeSelector.statics.defaultTitleGapLarge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        ThemeSelector.statics.defaultBorderRadius),
                    color: ThemeSelector.colors.primary,
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).confirmDelivery,
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
      if (i % 3 == 0)
        canvas.drawLine(Offset(0.0, i), Offset(0.0, i + 5), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
