import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/components/login_to_continue/login_to_continue.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (!state.isLoggedIn) return const LoginToContinue();

          return const Center(child: Text('chat'));
        },
      ),
    );
  }
}
