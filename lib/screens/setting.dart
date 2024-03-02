import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bank_setting_card.dart';
import 'package:yumi/template/user_setting_details.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var profileBloc = context.read<ProfileBloc>();
    // if (profileBloc.state.profile.guid.isEmpty) {
    profileBloc.add(ProfileEvent(context: context));
    // }

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: ThemeSelector.statics.defaultBlockGap,
                left: ThemeSelector.statics.defaultBlockGap,
                top: ThemeSelector.statics.defaultBlockGap,
              ),
              child: Row(
                children: [
                  Text(
                    state.profile.firstName + state.profile.lastName,
                    style: TextStyle(
                      color: ThemeSelector.colors.secondary,
                      fontSize: ThemeSelector.fonts.font_18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Expanded(child: Text('')),
                  Container(
                    width: ThemeSelector.statics.defaultTitleGap,
                    height: ThemeSelector.statics.defaultTitleGap,
                    decoration: BoxDecoration(
                      color: ThemeSelector.colors.primary,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadiusLarge),
                    ),
                    child: Center(
                      child: Text(
                        state.profile.firstName.isNotEmpty
                            ? state.profile.firstName[0].toUpperCase()
                            : '',
                        style: TextStyle(
                          color: ThemeSelector.colors.onPrimary,
                          fontSize: ThemeSelector.fonts.font_18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const UserSettingDetails(),
                    const BankSettingCard(),
                    Padding(
                      padding:
                          EdgeInsets.all(ThemeSelector.statics.defaultTitleGap),
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          width: ThemeSelector.statics.buttonWidth,
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                ThemeSelector.statics.defaultTitleGapLarge,
                            vertical: ThemeSelector.statics.defaultBlockGap,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeSelector.colors.primary,
                            borderRadius: BorderRadius.circular(
                                ThemeSelector.statics.defaultBorderRadiusSmall),
                          ),
                          child: Text(
                            S.of(context).deleteAccount,
                            style: TextStyle(
                                color: ThemeSelector.colors.onPrimary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
