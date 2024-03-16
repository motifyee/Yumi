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
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: ThemeSelector.fonts.font_10),
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
                      style: Theme.of(context).textTheme.bodyMedium,
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
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: ThemeSelector.fonts.font_16,
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
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
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
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}
