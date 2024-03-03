import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/chef_bannar.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';

class FeaturedChefsScreen extends StatelessWidget {
  const FeaturedChefsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationTemplate(
      scrollDirection: Axis.vertical,
      loadDate: () {},
      child: Padding(
        padding: EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
        child: Column(
          children: [
            for (var chef in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
              GestureDetector(
                onTap: () {
                  context.router.push(ChefProfile(chef: chef));
                },
                child: ChefBanner(
                  chef: chef,
                  width: MediaQuery.of(context).size.width -
                      (ThemeSelector.statics.defaultBlockGap * 2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        ThemeSelector.statics.defaultBorderRadius),
                    topRight: Radius.circular(
                        ThemeSelector.statics.defaultBorderRadius),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
