import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/bankinfo/cubit/bankinfo_cubit.dart';
import 'package:yumi/app/pages/settings/components/profile/profile_card.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/settings/components/bankinfo/bankinfo_card.dart';
import 'package:yumi/app/components/dialog.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fToast = FToast();
    fToast.init(context);

    final deleteAccountButton = InteractiveButton(
      backgroundColor: ThemeSelector.colors.error,
      height: 40,
      label: S.of(context).deleteAccount,
      icon: Icon(Icons.delete, color: ThemeSelector.colors.onSecondary),
      onPressed: () async {
        if (!await confirmDeleteAccount(context)) {
          return;
        }

        await G.rd<ProfileCubit>().deleteProfile().then(
          (value) {
            if (!value.contains("Deleting a Account")) {
              G.showToast(
                "Could not delete account",
                context: context,
              );
            }

            G.showToast(
              "Account Deleted!",
              context: context,
              gravity: ToastGravity.CENTER,
            );

            context.read<UserCubit>().reset();

            context.router.replaceAll([const LoginRoute()]);
          },
        );
      },
    );

    final secondCard =
        G.isCustomerApp ? const DeliveryAddresses() : const BankInfoCard();

    final pageItems = [
      SizedBox(height: ThemeSelector.statics.defaultBorderRadiusExtraLarge),
      // profile card
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultTitleGap,
        ),
        child: const ProfileCard(),
      ),
      SizedBox(height: ThemeSelector.statics.defaultBorderRadiusExtraLarge),
      // (bank info | delivery addresses) card
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultTitleGap,
        ),
        child: secondCard,
      ),
      SizedBox(height: ThemeSelector.statics.defaultBorderRadiusExtraLarge),
      // delete account button
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: deleteAccountButton,
      ),
      SizedBox(height: ThemeSelector.statics.defaultBorderRadiusExtraLarge),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<BankInfoCubit>().getBankInfo();
                context.read<ProfileCubit>().getProfile();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(children: pageItems),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> confirmDeleteAccount(context) async {
  bool confirm = false;
  await showAlertDialog(
    context: context,
    title: const Text("confirm"),
    dismissible: true,
    content: const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "Are you sure you want to delete your account?",
      ),
    ),
    actions: {
      "Cancel": null,
      "Delete": (_) async {
        confirm = true;

        G.pop();
      }
    },
  );

  return confirm;
}

class DeliveryAddresses extends StatelessWidget {
  const DeliveryAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
