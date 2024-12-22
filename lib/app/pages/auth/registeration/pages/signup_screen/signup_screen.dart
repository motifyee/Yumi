import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/auth/registeration/pages/registeration_step.dart';
import 'package:yumi/app/pages/auth/registeration/registeration_screen/registeration_screen.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/cubit/signup_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/signup_form.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: RegisterationPage(
        step: RegStep.signup,
        nextStep: RegStep.addPhone,
        page: SignupScreenContent(onDone: (signupData) => {}),
      ),
    );
  }
}

class SignupScreenContent extends StatelessWidget {
  final void Function(SignupData) onDone;

  SignupScreenContent({super.key, required this.onDone});

  final regCubit = G().rd<RegCubit>();

  @override
  Widget build(BuildContext context) {
    final pageItems = [
      const SizedBox(height: CommonDimens.defaultBlockGap),
      // Create Account Header
      Text(
        S.of(context).createAccount,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      // Create New Account Subheader
      Text(
        S.of(context).createNewAccount,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      const SizedBox(height: CommonDimens.defaultTitleGap),
      SignUpForm(key: key),
      // const SizedBox(height: CommonDimens.defaultBlockGap),
      // const SocialLogin(),
      const SizedBox(height: CommonDimens.defaultBlockGap),
      // Already have an account? Login
      TextButton(
        onPressed: () {
          context.read<RegCubit>().reset();
          context.router.replace(const LoginRoute());
        },
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: S.of(context).alreadyHaveAccount),
              const WidgetSpan(
                child: SizedBox(width: CommonFontSize.font_12 / 2),
              ),
              TextSpan(
                text: S.of(context).login,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: CommonFontSize.font_12 * 1.3),
              ),
            ],
          ),
        ),
      ),
    ];

    return PopScope(
      canPop: regCubit.state.partialFlow ? true : false,
      onPopInvoked: (didPop) {
        if (!regCubit.state.partialFlow) askToLogout(context);
      },
      child: ScreenContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: CommonColors.primary),
          ),
          body: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageItems,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
