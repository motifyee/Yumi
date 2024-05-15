import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';

class MealListCard extends StatelessWidget {
  const MealListCard({
    super.key,
    required this.meal,
    this.onTap,
    this.isDisabled = false,
  });

  final MealModel meal;
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
          height: ThemeSelector.statics.defaultImageHeightSmall +
              ThemeSelector.statics.defaultGap,
          child: Row(
            children: [
              Container(
                  width: ThemeSelector.statics.defaultImageHeightSmall,
                  height: ThemeSelector.statics.defaultImageHeightSmall,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ThemeSelector.statics.defaultGap),
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
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultGap),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                    Text(
                      meal.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: ThemeSelector.fonts.font_14),
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
                                      color: ThemeSelector.colors.primary,
                                      borderRadius: BorderRadius.circular(
                                          ThemeSelector
                                              .statics.defaultBlockGap)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ThemeSelector
                                          .statics.defaultMicroGap),
                                  child: Row(
                                    children: [
                                      Text(
                                        '4.5',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontSize:
                                                    ThemeSelector.fonts.font_9),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: ThemeSelector.colors.onPrimary,
                                        size: ThemeSelector.fonts.font_10,
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
