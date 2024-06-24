import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/menu/meal.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/text_currency.dart';

class ChefMealBasketCard extends StatelessWidget {
  const ChefMealBasketCard({
    super.key,
    required this.meal,
    this.onTap,
    this.isDisabled = false,
  });

  final Meal meal;
  final Function()? onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ThemeSelector.statics.defaultGap),
      child: GestureDetector(
        onTap: isDisabled ? null : onTap,
        child: Container(
          padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ThemeSelector.colors.shadow.withOpacity(.1),
                blurRadius: 3,
                offset: const Offset(2, 3),
              )
            ],
            color: ThemeSelector.colors.background,
          ),
          width: MediaQuery.of(context).size.width * .95,
          child: Row(
            children: [
              Container(
                width: ThemeSelector.statics.defaultImageHeightSmall,
                height: ThemeSelector.statics.defaultImageHeightSmall,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        ThemeSelector.statics.defaultGap)),
                child: ImageFiltered(
                  imageFilter: isDisabled
                      ? const ColorFilter.mode(
                          Colors.grey, BlendMode.saturation)
                      : const ColorFilter.mode(
                          Colors.transparent, BlendMode.darken),
                  child: Image.memory(
                    Uri.parse(meal.photo ?? '').data?.contentAsBytes() ??
                        Uint8List(0),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/354.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultGap),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          meal.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: ThemeSelector.fonts.font_16),
                        )),
                        Container(
                          width: ThemeSelector.statics.defaultTitleGap,
                          height: ThemeSelector.statics.defaultTitleGap,
                          decoration: BoxDecoration(
                              color: isDisabled
                                  ? ThemeSelector.colors.secondaryFaint
                                  : ThemeSelector.colors.primary,
                              borderRadius: BorderRadius.circular(
                                  ThemeSelector.statics.defaultTitleGap)),
                          child: Center(
                            child: Text(
                              '${meal.portionPersons}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: ThemeSelector.colors.onSuccess),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextCurrency(
                          value: meal.price1 ?? 0,
                          fontSize: ThemeSelector.fonts.font_14,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ThemeSelector.statics.defaultGap),
                          child: SvgPicture.asset(
                            meal.isFavoritProduct == true
                                ? 'assets/images/heart.svg'
                                : 'assets/images/heart_outline.svg',
                            colorFilter: ColorFilter.mode(
                                isDisabled
                                    ? ThemeSelector.colors.secondary
                                    : ThemeSelector.colors.primary,
                                BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
