import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/product_in_card.dart';
import 'package:yumi/template/text_currency.dart';

class OrderCard extends StatefulWidget {
  OrderCard({super.key, required this.data});

  final data;
  bool isView = false;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.defaultBlockGap,
            vertical: ThemeSelector.statics.defaultTitleGap,
          ),
          margin: EdgeInsets.symmetric(
              vertical: ThemeSelector.statics.defaultTitleGap),
          decoration: BoxDecoration(
            color: ThemeSelector.colors.onPrimary,
            boxShadow: [
              BoxShadow(
                color: ThemeSelector.colors.secondaryFaint.withOpacity(.3),
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
                        '${S.of(context).orderId}: #1302',
                        style: TextStyle(
                          color: ThemeSelector.colors.primary,
                          fontSize: ThemeSelector.fonts.font_12,
                        ),
                      ),
                      Text(
                        '10-05-2022 | 16:51',
                        style: TextStyle(
                            color: ThemeSelector.colors.secondaryTant,
                            fontSize: ThemeSelector.fonts.font_9,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  TextCurrency(value: 10.00),
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/label_yellow.svg'),
                  SizedBox(
                    width: ThemeSelector.statics.defaultGap,
                  ),
                  Text(
                    S.of(context).clickTheIconToViewCustomerNotes,
                    style: TextStyle(
                        color: ThemeSelector.colors.secondary,
                        fontSize: ThemeSelector.fonts.font_10),
                  ),
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              for (var _ in widget.isView ? [0, 1, 2] : [0])
                const ProductInCard(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).deliveryFee,
                      style: TextStyle(
                          color: ThemeSelector.colors.secondary,
                          fontSize: ThemeSelector.fonts.font_12),
                    ),
                  ),
                  TextCurrency(
                    value: 5.00,
                    fontSize: ThemeSelector.fonts.font_14,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).theTotalPriceIncludesTax,
                    style: TextStyle(
                        color: ThemeSelector.colors.primary,
                        fontSize: ThemeSelector.fonts.font_10,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).total,
                      style: TextStyle(
                        color: ThemeSelector.colors.secondary,
                        fontSize: ThemeSelector.fonts.font_16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextCurrency(value: 10.00),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: ThemeSelector.statics.defaultTitleGap / 2,
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
              style: TextStyle(
                color: ThemeSelector.colors.onPrimary,
                fontSize: ThemeSelector.fonts.font_12,
              ),
            ),
          ),
        ),
        Positioned(
          right: ThemeSelector.statics.defaultGap,
          bottom: 0,
          child: TextButton(
            onPressed: () {
              setState(() {
                widget.isView = !widget.isView;
              });
            },
            child: Text(
              S.of(context).view,
              style: TextStyle(
                color: ThemeSelector.colors.secondary,
                fontSize: ThemeSelector.fonts.font_12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
