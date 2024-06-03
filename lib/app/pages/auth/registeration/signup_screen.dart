import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/auth/registeration/reg_screen.dart';
import 'package:yumi/app/pages/auth/registeration/signup_form.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/login_thrid_part.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
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
                        SignUpForm(
                          key: key,
                          signUpFormKey: signUpFormKey,
                          passwordController: passwordController,
                        ),
                        SizedBox(
                          height: ThemeSelector.statics.defaultBlockGap,
                        ),
                        const LoginThirdPart(),
                        SizedBox(
                          height: ThemeSelector.statics.defaultBlockGap,
                        ),
                        TextButton(
                          onPressed: () {
                            // context.router.pop();
                            context.read<RegCubit>().reset();
                            context.router.replace(LoginRoute());
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
