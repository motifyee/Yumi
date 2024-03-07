import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/categories_list_dialog.dart';
import 'package:yumi/template/chef_bannar.dart';
import 'package:yumi/template/offer_carousel.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/text_form_field.dart';

class CustomerNews extends StatelessWidget {
  CustomerNews({super.key, required this.menuTarget});

  MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultBlockGap),
          child: Row(
            children: [
              SizedBox(
                  height: ThemeSelector.statics.defaultLineGap,
                  width: ThemeSelector.statics.defaultLineGap,
                  child: SvgPicture.asset(
                    'assets/images/location'
                    '.svg',
                    fit: BoxFit.fill,
                  )),
              SizedBox(width: ThemeSelector.statics.defaultMicroGap),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                    style: Theme.of(context).textTheme.labelMedium,
                    children: [
                      TextSpan(
                        text: S.of(context).hi,
                      ),
                      TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: 'Ayman!',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
                  Text(
                    S.of(context).whatYouWishToEatToday,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultInputGap),
          child: TextFormFieldTemplate(
            borderStyle: TextFormFieldBorderStyle.borderedRound,
            hintText: S.of(context).searchForFood,
            prefixIcon: Padding(
              padding: EdgeInsets.all(ThemeSelector.statics.defaultInputGap),
              child: SvgPicture.asset('assets/images/search.svg'),
            ),
            suffixIcon: GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(ThemeSelector.statics.defaultInputGap),
                child: SvgPicture.asset('assets/images/config.svg'),
              ),
            ),
          ),
        ),
        OfferCarousel(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: ThemeSelector.statics.defaultTitleGap,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              left: -ThemeSelector.statics.defaultLineGap,
              child: GestureDetector(
                child: Container(
                  height: ThemeSelector.statics.defaultTitleGap,
                  width: (MediaQuery.of(context).size.width / 4) +
                      (ThemeSelector.statics.defaultLineGap * 1.5),
                  decoration: BoxDecoration(
                      color: ThemeSelector.colors.backgroundTant,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadiusMedium),
                      boxShadow: [
                        BoxShadow(
                            color: ThemeSelector.colors.shadow.withOpacity(.1),
                            blurRadius: 4)
                      ]),
                  child: Center(
                      child: Text(
                    S.of(context).dishName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: ThemeSelector.fonts.font_9),
                  )),
                ),
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width / 4) -
                  ThemeSelector.statics.defaultLineGap,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => CategoriesListDialog());
                },
                child: Container(
                  height: ThemeSelector.statics.defaultTitleGap,
                  width: (MediaQuery.of(context).size.width / 4) +
                      (ThemeSelector.statics.defaultLineGap),
                  decoration: BoxDecoration(
                      color: ThemeSelector.colors.backgroundTant,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadius),
                      boxShadow: [
                        BoxShadow(
                            color: ThemeSelector.colors.shadow.withOpacity(.1),
                            blurRadius: 4)
                      ]),
                  child: Center(
                      child: Text(
                    S.of(context).cuisines,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: ThemeSelector.fonts.font_9),
                  )),
                ),
              ),
            ),
            Positioned(
              left: ((MediaQuery.of(context).size.width / 4) * 2) -
                  ThemeSelector.statics.defaultLineGap,
              child: GestureDetector(
                child: Container(
                  height: ThemeSelector.statics.defaultTitleGap,
                  width: (MediaQuery.of(context).size.width / 4) +
                      (ThemeSelector.statics.defaultLineGap),
                  decoration: BoxDecoration(
                      color: ThemeSelector.colors.backgroundTant,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadius),
                      boxShadow: [
                        BoxShadow(
                            color: ThemeSelector.colors.shadow.withOpacity(.1),
                            blurRadius: 4)
                      ]),
                  child: Center(
                      child: Text(
                    S.of(context).recentSearch,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: ThemeSelector.fonts.font_9),
                  )),
                ),
              ),
            ),
            Positioned(
              left: ((MediaQuery.of(context).size.width / 4) * 3) -
                  ThemeSelector.statics.defaultLineGap,
              child: GestureDetector(
                child: Container(
                  height: ThemeSelector.statics.defaultTitleGap,
                  width: (MediaQuery.of(context).size.width / 4) +
                      (ThemeSelector.statics.defaultLineGap),
                  decoration: BoxDecoration(
                      color: ThemeSelector.colors.backgroundTant,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadius),
                      boxShadow: [
                        BoxShadow(
                            color: ThemeSelector.colors.shadow.withOpacity(.1),
                            blurRadius: 4)
                      ]),
                  child: Center(
                      child: Text(
                    S.of(context).suggestions,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: ThemeSelector.fonts.font_9),
                  )),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultGap * 2,
                  vertical: ThemeSelector.statics.defaultGap),
              child: Row(
                children: [
                  Container(
                    width: ThemeSelector.statics.defaultLineGap,
                    height: ThemeSelector.statics.defaultLineGap,
                    padding:
                        EdgeInsets.all(ThemeSelector.statics.defaultMicroGap),
                    decoration: BoxDecoration(
                        color: ThemeSelector.colors.secondary,
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.defaultBorderRadiusSmall)),
                    child: Center(
                      child: SvgPicture.asset('assets/images/profile1.svg'),
                    ),
                  ),
                  Text(' '),
                  Text(
                    menuTarget == MenuTarget.preOrder
                        ? S.of(context).chefs
                        : S.of(context).onlineChefs,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: ThemeSelector.fonts.font_16,
                        ),
                  ),
                ],
              ),
            ),
            PaginationTemplate(
              scrollDirection: Axis.horizontal,
              loadDate: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultGap),
                child: Row(
                  children: [
                    for (var chef in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
                      GestureDetector(
                        onTap: () {
                          context.router.push(ChefProfile(chef: chef));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ThemeSelector.statics.defaultGap),
                          child: ChefBanner(
                            chef: chef,
                            width: MediaQuery.of(context).size.width -
                                (ThemeSelector.statics.defaultGap * 10),
                            height:
                                ThemeSelector.statics.defaultImageHeightSmall,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  ThemeSelector.statics.defaultBorderRadius),
                              topRight: Radius.circular(
                                  ThemeSelector.statics.defaultBorderRadius),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: SvgPicture.asset('assets/images/surprise.svg'),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.defaultBlockGap,
                vertical: ThemeSelector.statics.defaultMicroGap,
              ),
              decoration: BoxDecoration(
                  color: ThemeSelector.colors.backgroundTant,
                  borderRadius: BorderRadius.circular(
                      ThemeSelector.statics.defaultBorderRadiusExtraLarge)),
              child: Column(
                children: [
                  Text(
                    '150',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    S.of(context).points,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
