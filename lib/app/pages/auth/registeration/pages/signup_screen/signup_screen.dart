import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/auth/registeration/pages/registeration_step.dart';
import 'package:yumi/app/pages/auth/registeration/registeration_screen/registeration_screen.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/cubit/signup_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/signup_form.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/auth/login/login_thrid_part.dart';
import 'package:yumi/app/components/screen_container.dart';

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
        page: SignupScreenContent(),
      ),
    );
  }
}

class SignupScreenContent extends StatelessWidget {
  SignupScreenContent({super.key});

  final regCubit = G.rd<RegCubit>();

  @override
  Widget build(BuildContext context) {
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
            iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
          ),
          body: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: ThemeSelector.statics.defaultBlockGap,
                        ),
                        Text(S.of(context).createAccount,
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(
                          S.of(context).createNewAccount,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(
                          height: ThemeSelector.statics.defaultTitleGap,
                        ),
                        SignUpForm(key: key),
                        SizedBox(
                          height: ThemeSelector.statics.defaultBlockGap,
                        ),
                        const SocialLogin(),
                        SizedBox(
                          height: ThemeSelector.statics.defaultBlockGap,
                        ),
                        TextButton(
                          onPressed: () {
                            // context.router.pop();
                            context.read<RegCubit>().reset();
                            context.router.replace(const LoginRoute());
                          },
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                    text: S.of(context).alreadyHaveAccount),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: ThemeSelector.fonts.font_12 / 2,
                                )),
                                TextSpan(
                                    text: S.of(context).login,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            fontSize:
                                                ThemeSelector.fonts.font_12 *
                                                    1.3)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
