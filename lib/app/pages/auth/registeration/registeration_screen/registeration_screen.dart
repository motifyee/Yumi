import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:common_code/components/dialog.dart';

@RoutePage()
class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final regCubit = context.read<RegCubit>();

    return Builder(
      builder: (context) {
        G().rd<UserCubit>().loadUser().then((_) {
          if (!regCubit.state.registerationStarted) regCubit.initReg();
        });

        if (regCubit.state.partialFlow) return const AutoRouter();

        return Stack(
          children: [
            const Positioned.fill(
              child: AutoRouter(),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () => askToLogout(context),
                  icon: SvgPicture.asset(AppAssets.logoutMenuIcon),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Future<void> askToLogout(BuildContext context, {bool isBack = false}) async {
  if (isBack) {
    context.router.maybePop();
    return;
  }

  bool isLoggedIn = context.read<UserCubit>().state.user.accessToken.isNotEmpty;
  await showAlertDialog(
    context: context,
    title: Text(isLoggedIn ? S.of(context).logout : S.of(context).leave),
    content: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(isLoggedIn
          ? S.of(context).areYouSureYouWantToLogout
          : S.of(context).areYouSureYouWantToLeave),
    ),
    actions: {
      S.current.cancel: null,
      S.current.ok: (ctx) async {
        await G().rd<UserCubit>().reset();
        await G().rd<RegCubit>().finish(false);
      },
    },
    insetPadding: 0,
  );
}
