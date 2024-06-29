import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/components/profile/profile_card.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/settings/components/bankinfo/bank_settings_card.dart';
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

    final items = [
      const ProfileCard(),
      if (G.isCustomerApp)
        const DeliveryAddresses()
      else
        BlocConsumer<BankInfoBloc, BankInfoState>(
          listener: (context, state) {},
          builder: (context, state) =>
              BankSettingsCard(bankInfo: state.selectedBank),
        ),
      SizedBox(height: ThemeSelector.statics.defaultBlockGap),
      Padding(
        padding: const EdgeInsets.all(40),
        child: deleteAccountButton,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: items),
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
