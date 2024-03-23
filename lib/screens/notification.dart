import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: TextButton(
            onPressed: () {
              context.router.popForced();
            },
            child: Icon(
              Icons.arrow_back,
              color: ThemeSelector.colors.primary,
            )),
        title: Text(
          S.of(context).notification,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.defaultLineGap),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/notification.svg'),
                Text('  '),
                Text(
                  S.of(context).notification,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          Expanded(
            child: PaginationTemplate(
              scrollDirection: Axis.vertical,
              loadDate: () {},
              child: Column(
                children: [
                  for (var i in [
                    0,
                    1,
                    2,
                    34,
                    5,
                    6,
                    8,
                    7,
                    5,
                    5,
                    7,
                    5,
                    5,
                    5,
                    52,
                    5,
                    85,
                    65,
                    5,
                    5,
                    9,
                    5,
                    5,
                    5,
                    4
                  ])
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ThemeSelector.statics.defaultGap,
                            horizontal: ThemeSelector.statics.defaultTitleGap),
                        child: Row(
                          children: [
                            Container(
                              width: ThemeSelector.statics.defaultMediumGap,
                              height: ThemeSelector.statics.defaultMediumGap,
                              decoration: BoxDecoration(
                                  color: ThemeSelector.colors.backgroundTant,
                                  borderRadius: BorderRadius.circular(
                                      ThemeSelector.statics.defaultMediumGap)),
                              child: Center(
                                child: SvgPicture.asset(
                                    'assets/images/offer_icon.svg'),
                              ),
                            ),
                            SizedBox(width: ThemeSelector.statics.defaultGap),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Save 30% when you order burger',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                                Text('2023-02-10 | 14:11',
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
