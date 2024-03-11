import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/features/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/features/settings/profle/bloc/profile_bloc.dart';
import 'package:yumi/features/settings/profle/profile_card.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/features/settings/bankinfo/bank_settings_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const UserSettingDetails(),
                    BlocConsumer<BankInfoBloc, BankInfoState>(
                      listener: (context, state) {},
                      builder: (context, state) =>
                          BankSettingsCard(bankInfo: state.selectedBank),
                    ),
                    Column(
                      children: [
                        SizedBox(height: ThemeSelector.statics.defaultBlockGap),

                        // Delete account button
                        TextButton(
                          onPressed: () => {},
                          child: Container(
                            width: 175,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  ThemeSelector
                                      .statics.defaultBorderRadiusLarge)),
                              color: ThemeSelector.colors.error,
                            ),
                            child: SizedBox(
                              width: 175,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: ThemeSelector.colors.onSecondary,
                                  ),
                                  Text(
                                    S.of(context).deleteAccount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
