import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/bank-account/bankinfo_bloc.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bank_settings_card.dart';
import 'package:yumi/template/user_setting_details.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var profileBloc = context.read<ProfileBloc>();
    profileBloc.add(ProfileEvent(context: context));
    context.read<BankInfoBloc>().add(BankInfoEvent(context: context));

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.only(
            //     right: ThemeSelector.statics.defaultBlockGap,
            //     left: ThemeSelector.statics.defaultBlockGap,
            //     top: ThemeSelector.statics.defaultBlockGap,
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         state.profile.fullName,
            //         style: TextStyle(
            //           color: ThemeSelector.colors.secondary,
            //           fontSize: ThemeSelector.fonts.font_18,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //       const Expanded(child: Text('')),
            //       Container(
            //         width: ThemeSelector.statics.defaultTitleGap,
            //         height: ThemeSelector.statics.defaultTitleGap,
            //         decoration: BoxDecoration(
            //           color: ThemeSelector.colors.primary,
            //           borderRadius: BorderRadius.circular(
            //               ThemeSelector.statics.defaultBorderRadiusLarge),
            //         ),
            //         child: Center(
            //           child: Text(
            //             // state.profile.firstName,
            //             'X',
            //             style: TextStyle(
            //               color: ThemeSelector.colors.onPrimary,
            //               fontSize: ThemeSelector.fonts.font_18,
            //               fontWeight: FontWeight.w700,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const UserSettingDetails(),
                    BlocConsumer<BankInfoBloc, BankInfoState>(
                      listener: (context, state) {},
                      builder: (context, state) => Column(
                        children: [
                          ...state.banks.map((e) => BankSettingsCard(id: e.id)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                        TextButton(
                          onPressed: () => showBankInfoEdit(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  ThemeSelector
                                      .statics.defaultBorderRadiusLarge)),
                              color: ThemeSelector.colors.primary,
                            ),
                            child: SizedBox(
                              width: 175,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: ThemeSelector.colors.onSecondary,
                                  ),
                                  Text(
                                    S.of(context).addBankAccount,
                                    style: TextStyle(
                                        color:
                                            ThemeSelector.colors.onSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              margin: const EdgeInsets.all(0),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    ThemeSelector.statics.defaultTitleGapLarge,
                                vertical: ThemeSelector.statics.defaultBlockGap,
                              ),
                              decoration: BoxDecoration(
                                color: ThemeSelector.colors.error,
                                borderRadius: BorderRadius.circular(
                                    ThemeSelector
                                        .statics.defaultBorderRadiusExtraLarge),
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
