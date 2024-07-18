import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/domain/meal/entities/meal.dart';

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
          height:
              CommonDimens.defaultImageHeightSmall + CommonDimens.defaultGap,
          child: Row(
            children: [
              Container(
                  width: CommonDimens.defaultImageHeightSmall,
                  height: CommonDimens.defaultImageHeightSmall,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(CommonDimens.defaultGap),
                  ),
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
                      errorBuilder: (context, error, stackTrace) =>
                          ImageFiltered(
                        imageFilter: isDisabled
                            ? const ColorFilter.mode(
                                Colors.grey, BlendMode.saturation)
                            : const ColorFilter.mode(
                                Colors.transparent, BlendMode.darken),
                        child: Image.asset(
                          'assets/images/354.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultGap),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: CommonDimens.defaultBlockGap),
                    Text(
                      meal.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: CommonFontSize.font_14),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        childAspectRatio: 4.0,
                        children: [
                          for (var i in [0, 1, 2, 3])
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: CommonColors.primary,
                                      borderRadius: BorderRadius.circular(
                                          CommonDimens.defaultBlockGap)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: CommonDimens.defaultMicroGap),
                                  child: Row(
                                    children: [
                                      Text(
                                        '4.5',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontSize:
                                                    CommonFontSize.font_9),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: CommonColors.onPrimary,
                                        size: CommonFontSize.font_10,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'aaaaa a a a a aaaaaaaaaaaaa a a ',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          meal.isFavoriteProduct == true
                              ? 'assets/images/heart.svg'
                              : 'assets/images/heart_outline.svg',
                          colorFilter: ColorFilter.mode(
                              isDisabled
                                  ? CommonColors.secondary
                                  : CommonColors.primary,
                              BlendMode.srcIn),
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
