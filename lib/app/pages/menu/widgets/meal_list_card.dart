import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';

class MealListCard extends StatelessWidget {
  const MealListCard({
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
      padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap),
      child: GestureDetector(
        onTap: isDisabled ? null : onTap,
        child: Container(
          padding: const EdgeInsets.all(CommonDimens.defaultGap),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: CommonColors.shadow.withOpacity(.1),
                blurRadius: 3,
                offset: const Offset(2, 3),
              )
            ],
            color: CommonColors.background,
          ),
          width: MediaQuery.of(context).size.width * .95,
          height: CommonDimens.defaultImageHeightSmall + CommonDimens.defaultGap,
          child: Row(
            children: [
              Container(
                  width: CommonDimens.defaultImageHeightSmall,
                  height: CommonDimens.defaultImageHeightSmall,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(CommonDimens.defaultGap),
                  ),
                  child: ImageFiltered(
                    imageFilter: isDisabled ? const ColorFilter.mode(Colors.grey, BlendMode.saturation) : const ColorFilter.mode(Colors.transparent, BlendMode.darken),
                    child: Image.memory(
                      Uri.parse(meal.photo ?? '').data?.contentAsBytes() ?? Uint8List(0),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => ImageFiltered(
                        imageFilter: isDisabled ? const ColorFilter.mode(Colors.grey, BlendMode.saturation) : const ColorFilter.mode(Colors.transparent, BlendMode.darken),
                        child: Image.asset(
                          'assets/images/354.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultGap),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: CommonDimens.defaultBlockGap),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          meal.name ?? '',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: CommonFontSize.font_16),
                        )),
                        Container(
                          width: CommonDimens.defaultTitleGap,
                          height: CommonDimens.defaultTitleGap,
                          decoration: BoxDecoration(color: isDisabled ? CommonColors.secondaryFaint : CommonColors.primary, borderRadius: BorderRadius.circular(CommonDimens.defaultTitleGap)),
                          child: Center(
                            child: Text(
                              '${meal.portionPersons}',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: CommonColors.onSuccess),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextCurrency(
                            value: meal.price1 ?? 0,
                            fontSize: CommonFontSize.font_14,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          meal.isFavoriteProduct == true ? 'assets/images/heart.svg' : 'assets/images/heart_outline.svg',
                          colorFilter: ColorFilter.mode(isDisabled ? CommonColors.secondary : CommonColors.primary, BlendMode.srcIn),
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
