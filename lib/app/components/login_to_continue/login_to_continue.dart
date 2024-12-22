import 'package:common_code/common_code.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:yumi/routes/routes.gr.dart';

class LoginToContinue extends StatelessWidget {
  const LoginToContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        children: [
          Image.asset(CommonAssets.chefPanic),
          const SizedBox(height: 20),
          Text(
            'Sorry!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CommonColors.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'You are not logged in yet',
            style: TextStyle(fontSize: 10, color: CommonColors.secondaryTant),
          ),
          const SizedBox(height: 20),
          InteractiveButton(
            label: 'Login to continue',
            onPressed: () {
              context.read<UserCubit>().reset();
              context.router.replaceAll([const LoginRoute()]);
            },
          ),
        ],
      ),
    );
  }
}
