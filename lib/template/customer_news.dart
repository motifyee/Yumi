import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/chef_bannar.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/carousel.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/text_form_field.dart';

class CustomerNews extends StatelessWidget {
  const CustomerNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultBlockGap),
          child: Row(
            children: [
              SizedBox(
                  height: ThemeSelector.statics.defaultBlockGap,
                  width: ThemeSelector.statics.defaultBlockGap,
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
                    style: TextStyle(
                      fontSize: ThemeSelector.fonts.font_18,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: S.of(context).hi,
                        style: TextStyle(color: ThemeSelector.colors.secondary),
                      ),
                      TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: 'Ayman!',
                        style: TextStyle(color: ThemeSelector.colors.primary),
                      ),
                    ],
                  )),
                  Text(
                    S.of(context).whatYouWishToEatToday,
                    style: TextStyle(color: ThemeSelector.colors.secondaryTant),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
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
        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
        OfferCarousel(),
        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
        PaginationTemplate(
          scrollDirection: Axis.horizontal,
          loadDate: () {},
          child: Row(
            children: [
              for (var chef in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
                GestureDetector(
                  onTap: () {
                    context.router.push(ChefProfile(chef: chef));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ThemeSelector.statics.defaultInputGap),
                    child: ChefBanner(
                      chef: chef,
                      width: MediaQuery.of(context).size.width -
                          (ThemeSelector.statics.defaultInputGap * 5),
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
      ],
    );
  }
}
