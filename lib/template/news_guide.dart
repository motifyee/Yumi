import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/user/user_model.dart';
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
      height: 550,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultGap),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '${S.of(context).hi} ${context.read<UserCubit>().state.user.userName},',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const Location(),
              Text(
                S.of(context).thisSectionYourSavedAddress,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              StatusButton(forGuide: StatusEnum.online),
              Text(
                S.of(context).thisButtonMeansThatYouAreCurrentlyAvailable,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              StatusButton(forGuide: StatusEnum.offline),
              Text(
                S.of(context).thisButtonMeansThatYouAreCurrentlyClosed,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              StatusButton(forGuide: StatusEnum.busy),
              Text(
                S.of(context).thisButtonMeansThatYouAreCurrentlyNotAvailable,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () async {
                        await LocalStorage.sharedRef
                            .setValue(LocalStorage.newsGuide, true);
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).skip,
                        style: Theme.of(context).textTheme.headlineMedium,
                      )),
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
            ],
          ),
        ),
      ),
    );
  }
}
