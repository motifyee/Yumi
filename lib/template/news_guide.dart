import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/local_storage.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/location.dart';
import 'package:yumi/template/screen_container.dart';
import 'package:yumi/template/status_button.dart';

class NewsGuide extends StatelessWidget {
  const NewsGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight:
            Radius.circular(ThemeSelector.statics.defaultBorderRadiusExtreme),
        topLeft:
            Radius.circular(ThemeSelector.statics.defaultBorderRadiusExtreme),
      )),
      child: ScreenContainer(
        child: Container(
          padding: EdgeInsets.only(
              top: ThemeSelector.statics.defaultBorderRadiusExtreme / 2,
              left: ThemeSelector.statics.defaultBlockGap,
              right: ThemeSelector.statics.defaultBlockGap,
              bottom: 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultGap),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '${S.of(context).hi}: Ayman,',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(height: ThemeSelector.statics.defaultBlockGap),
              Location(),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Text(
                S.of(context).thisSectionYourSavedAddress,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              SizedBox(height: ThemeSelector.statics.defaultTitleGap),
              StatusButton(status: StatusEnum.opened, onPressed: () {}),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Text(
                S.of(context).thisButtonMeansThatTheChefIsCurrentlyAvailable,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              SizedBox(height: ThemeSelector.statics.defaultTitleGap),
              StatusButton(status: StatusEnum.closed, onPressed: () {}),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Text(
                S.of(context).thisButtonMeansThatTheChefIsCurrentlyClosed,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              SizedBox(height: ThemeSelector.statics.defaultTitleGap),
              StatusButton(status: StatusEnum.busy),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Text(
                S.of(context).thisButtonMeansThatTheChefIsCurrentlyNotAvailable,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () async {
                        await LocalStorage.sharedRef
                            .setValue('news_guide', true);
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).skip,
                        style: Theme.of(context).textTheme.headlineMedium,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
