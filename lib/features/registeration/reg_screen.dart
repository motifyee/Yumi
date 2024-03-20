import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/features/registeration/bloc/bloc.dart';

@RoutePage()
class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => RegBloc(),
          child: BlocConsumer<RegBloc, RegState>(
            listener: (context, state) {},
            builder: (context, state) {
              return const AutoRouter();
            },
          ),
        );
      },
    );
  }
}
