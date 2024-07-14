import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/order/widgets/location.dart';
import 'package:yumi/app/pages/order/widgets/status_button.dart';

class NewsGuide extends StatelessWidget {
  const NewsGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(CommonDimens.defaultBorderRadiusExtreme),
        topLeft: Radius.circular(CommonDimens.defaultBorderRadiusExtreme),
      )),
      child: ScreenContainer(
        child: Container(
          padding: const EdgeInsets.only(
              top: CommonDimens.defaultBorderRadiusExtreme / 2,
              left: CommonDimens.defaultBlockGap,
              right: CommonDimens.defaultBlockGap,
              bottom: 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultGap),
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
                      fontSize: CommonFontSize.font_16,
                    ),
              ),
              StatusButton(forGuide: UserStatus.online),
              Text(
                S.of(context).thisButtonMeansThatYouAreCurrentlyAvailable,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: CommonFontSize.font_16,
                    ),
              ),
              StatusButton(forGuide: UserStatus.offline),
              Text(
                S.of(context).thisButtonMeansThatYouAreCurrentlyClosed,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: CommonFontSize.font_16,
                    ),
              ),
              StatusButton(forGuide: UserStatus.busy),
              Text(
                S.of(context).thisButtonMeansThatYouAreCurrentlyNotAvailable,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: CommonFontSize.font_16,
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
              const SizedBox(height: CommonDimens.defaultGap),
            ],
          ),
        ),
      ),
    );
  }
}
