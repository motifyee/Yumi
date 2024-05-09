import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/profile/profile_card.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/settings/bankinfo/bank_settings_card.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const UserSettingDetails(),
                    if (G.isCustomerApp)
                      const DeliveryAddresses()
                    else
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
                          onPressed: () async {
                            await G
                                .rd<ProfileCubit>()
                                .deleteProfile()
                                .then((value) {
                              if (!value.contains("Deleting a Account")) return;

                              context.read<UserBloc>().add(UserResetEvent());
                              context.router.replaceAll([LoginRoute()]);
                            });
                          },
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

class DeliveryAddresses extends StatelessWidget {
  const DeliveryAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ThemeSelector.statics.defaultTitleGap,
        right: ThemeSelector.statics.defaultTitleGap,
        left: ThemeSelector.statics.defaultTitleGap,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(ThemeSelector.statics.defaultLineGap),
        decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          borderRadius: BorderRadius.circular(
              ThemeSelector.statics.defaultBorderRadiusSmall),
          boxShadow: [
            BoxShadow(
              color: ThemeSelector.colors.secondary.withOpacity(.15),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: InkWell(
          onTap: () => {
            context.router.replaceAll([const CustomerLocationRoute()])
          },
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              const Text(
                "Delivery Addresses",
              ),
              Expanded(child: Container()),
              const Icon(Icons.chevron_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
