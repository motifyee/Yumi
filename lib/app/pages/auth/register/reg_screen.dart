import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
// import 'package:yumi/features/registeration/bloc/bloc.dart';

@RoutePage()
class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var c = context.read<RegCubit>();
        context.read<UserBloc>().add(
              UserFromSharedRefEvent(
                context: context,
                route: null,
                afterFetchSuccess: (_, __) {
                  if (!c.state.registerationStarted) {
                    c.init();
                  }
                },
                autoLogin: (p0) {
                  if (!c.state.registerationStarted) {
                    c.init();
                  }
                },
              ),
            );

        return const AutoRouter();
        // return Scaffold(
        //   body: Container(
        //     padding: const EdgeInsets.all(10),
        //     child: const Card(
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(20))),
        //       child: AutoRouter(),
        //     ),
        //   ),
        // );
      },
    );
  }
}
