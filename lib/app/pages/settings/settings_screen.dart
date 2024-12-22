import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/components/login_to_continue/login_to_continue.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/bankinfo/cubit/bankinfo_cubit.dart';
import 'package:yumi/app/pages/settings/components/profile/profile_card.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';
import 'package:yumi/app/pages/settings/components/bankinfo/bankinfo_card.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fToast = FToast();
    fToast.init(context);

    final deleteAccountButton = InteractiveButton(
      backgroundColor: CommonColors.error,
      height: 40,
      label: S.of(context).deleteAccount,
      icon: Icon(Icons.delete, color: CommonColors.onSecondary),
      onPressed: () async {
        if (!await confirmDeleteAccount(context)) {
          return;
        }

        await G().rd<ProfileCubit>().deleteProfile().then(
          (value) {
            if (!value.contains('Deleting a Account')) {
              G().showToast(
                'Could not delete account',
                context: context,
              );
            }

            G().showToast(
              'Account Deleted!',
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
        G().isCustomerApp ? const DeliveryAddresses() : const BankInfoCard();

    final pageItems = [
      const SizedBox(height: CommonDimens.defaultBorderRadiusExtraLarge),
      // profile card
      const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CommonDimens.defaultTitleGap,
        ),
        child: ProfileCard(),
      ),
      const SizedBox(height: CommonDimens.defaultBorderRadiusExtraLarge),
      // (bank info | delivery addresses) card
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimens.defaultTitleGap,
        ),
        child: secondCard,
      ),
      const SizedBox(height: CommonDimens.defaultBorderRadiusExtraLarge),
      // delete account button
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: deleteAccountButton,
      ),
      const SizedBox(height: CommonDimens.defaultBorderRadiusExtraLarge),
    ];

    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (!state.isLoggedIn) return const LoginToContinue();

          return Column(
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
          );
        },
      ),
    );
  }
}

Future<bool> confirmDeleteAccount(context) async {
  bool confirm = false;
  await showAlertDialog(
    context: context,
    title: const Text('confirm'),
    dismissible: true,
    content: const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'Are you sure you want to delete your account?',
      ),
    ),
    actions: {
      S.of(context).cancel: null,
      S.of(context).delete: (_) async {
        confirm = true;

        G().pop();
      },
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
      padding: const EdgeInsets.all(CommonDimens.defaultLineGap),
      decoration: BoxDecoration(
        color: CommonColors.background,
        borderRadius:
            BorderRadius.circular(CommonDimens.defaultBorderRadiusSmall),
        boxShadow: [
          BoxShadow(
            color: CommonColors.secondary.withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => {
          context.router.replaceAll([const CustomerLocationRoute()]),
        },
        child: Row(
          children: [
            const Icon(Icons.location_on_outlined),
            const SizedBox(width: CommonDimens.defaultGap),
            const Text(
              'Delivery Addresses',
            ),
            Expanded(child: Container()),
            const Icon(Icons.chevron_right_outlined),
          ],
        ),
      ),
    );
  }
}
