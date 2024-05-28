import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/template/dialog.dart';

@RoutePage()
class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // if (!didPop) return;
        askToLogout(context);
      },
      child: Builder(
        builder: (context) {
          var regCubit = context.read<RegCubit>();
          context.read<UserBloc>().add(
                UserFromSharedRefEvent(
                  context: context,
                  route: null,
                  afterFetchSuccess: (_, __, user) {
                    if (!regCubit.state.registerationStarted) {
                      regCubit.init();
                    }
                  },
                  autoLogin: (p0) {
                    if (!regCubit.state.registerationStarted) {
                      regCubit.init();
                    }
                  },
                ),
              );

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
                    icon: SvgPicture.asset('assets/images/logout_menu.svg'),
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

Future<void> askToLogout(BuildContext context) async {
  await showAlertDialog(
    context: context,
    title: const Text('Logout'),
    content: const Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text('Are you sure you want to logout?'),
    ),
    actions: {
      'Cancel': null,
      'Ok': (ctx) {
        G.read<UserBloc>().add(UserResetEvent());
        G.rd<RegCubit>().finish(false);
      },
    },
    insetPadding: 0,
  );
}
