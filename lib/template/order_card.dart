import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, required this.data});

  final data;

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
          margin: const EdgeInsets.symmetric(vertical: 40),
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
                        'Order Id: #1302',
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
                    'Click the icon to view customer notes',
                    style: TextStyle(
                        color: ThemeSelector.colors.secondary,
                        fontSize: ThemeSelector.fonts.font_10),
                  ),
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ThemeSelector.statics.defaultBorderRadiusSmall),
                          ),
                          child: Image.asset(
                            'assets/images/354.jpeg',
                            width: ThemeSelector.statics.iconSizeLarge,
                            height: ThemeSelector.statics.iconSizeLarge,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextCurrency(value: 5.00),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
