import 'package:auto_route/annotations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/chef_bannar.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/category_card.dart';
import 'package:yumi/template/chef_meal_card.dart';
import 'package:yumi/template/pagination_template.dart';

@RoutePage()
class ChefProfile extends StatelessWidget {
  ChefProfile({super.key, required this.chef});

  final dynamic chef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChefBanner(
              chef: chef,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                    ThemeSelector.statics.defaultBorderRadiusLarge),
              ),
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultGap),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        S.of(context).orderAgain,
                        style: TextStyle(
                          color: ThemeSelector.colors.secondary,
                          fontSize: ThemeSelector.fonts.font_12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  PaginationTemplate(
                    loadDate: () {},
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var meal in [0, 1, 2, 3, 4, 5, 6])
                          ChefMealCard(meal: meal)
                      ],
                    ),
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                  Row(
                    children: [
                      Text(
                        S.of(context).chefEvents,
                        style: TextStyle(
                          color: ThemeSelector.colors.secondary,
                          fontSize: ThemeSelector.fonts.font_12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ThemeSelector.statics.defaultImageHeight,
                    child: Swiper(
                      itemCount: 5,
                      autoplay: true,
                      viewportFraction: 0.8,
                      layout: SwiperLayout.STACK,
                      itemWidth: MediaQuery.of(context).size.width * .8,
                      itemBuilder: (context, index) => Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ThemeSelector
                                .statics.defaultBorderRadiusExtraLarge)),
                        child: Image.asset(
                          'assets/images/354.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                  Row(
                    children: [
                      Text(
                        S.of(context).orderAgain,
                        style: TextStyle(
                          color: ThemeSelector.colors.secondary,
                          fontSize: ThemeSelector.fonts.font_12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  PaginationTemplate(
                    loadDate: () {},
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            for (var meal in [0, 1, 2, 3, 4, 5, 6])
                              ChefMealCard(meal: meal)
                          ],
                        ),
                        Row(
                          children: [
                            for (var meal in [0, 1, 2, 3, 4])
                              ChefMealCard(meal: meal)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                  Row(
                    children: [
                      Text(
                        S.of(context).cuisine,
                        style: TextStyle(
                          color: ThemeSelector.colors.secondary,
                          fontSize: ThemeSelector.fonts.font_12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            for (var category in [0, 1, 2])
                              CategoriesCard(category: category),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              S.of(context).addPreOrder,
                              style: TextStyle(
                                color: ThemeSelector.colors.secondary,
                                fontSize: ThemeSelector.fonts.font_10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(' '),
                            Container(
                              width: ThemeSelector.statics.defaultLineGap,
                              height: ThemeSelector.statics.defaultLineGap,
                              decoration: BoxDecoration(
                                color: ThemeSelector.colors.primary,
                                borderRadius: BorderRadius.circular(
                                    ThemeSelector.statics.defaultLineGap),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: ThemeSelector.colors.onPrimary,
                                  size: ThemeSelector.fonts.font_12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).happyCustomer,
                            style: TextStyle(
                              color: ThemeSelector.colors.secondary,
                              fontSize: ThemeSelector.fonts.font_12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: ThemeSelector.colors.warning,
                                size: ThemeSelector.fonts.font_12,
                              ),
                              Text(
                                '4.8(1.3k Reviews)',
                                style: TextStyle(
                                    color: ThemeSelector.colors.secondaryTant,
                                    fontSize: ThemeSelector.fonts.font_12),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).createYourReviewNow,
                            style: TextStyle(
                              color: ThemeSelector.colors.secondaryTant,
                              fontSize: ThemeSelector.fonts.font_12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          RatingBar(
                              initialRating: 0,
                              allowHalfRating: true,
                              itemSize: ThemeSelector.fonts.font_24,
                              ratingWidget: RatingWidget(
                                empty: Icon(Icons.star_border,
                                    color: ThemeSelector.colors.warning),
                                full: Icon(Icons.star,
                                    color: ThemeSelector.colors.warning),
                                half: Icon(
                                  Icons.star_half,
                                  color: ThemeSelector.colors.warning,
                                ),
                              ),
                              onRatingUpdate: (value) {})
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
