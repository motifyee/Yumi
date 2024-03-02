import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/forms/profile_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/user_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/app_side_menu_items.dart';
import 'package:yumi/statics/capitalize_string.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/menu_button.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              child: SvgPicture.asset(
                'assets/images/side_bar_bg.svg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: ThemeSelector.statics.defaultTitleGap,
                left: ThemeSelector.statics.defaultBlockGap,
                right: ThemeSelector.statics.defaultBlockGap,
              ),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultGap),
                  Container(
                    padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(
                          width: 3,
                          color: ThemeSelector.colors.primary,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadiusExtreme),
                      color: ThemeSelector.colors.onPrimary,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        context
                            .read<NavigatorBloc>()
                            .add(NavigatorEvent(selectedIndex: 1));
                      },
                      child: Container(
                        width: 72,
                        height: 72,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: ThemeSelector.colors.secondary,
                          borderRadius: BorderRadius.circular(
                              ThemeSelector.statics.defaultBorderRadiusExtreme),
                        ),
                        child: Center(
                          child: Text(
                            (state.user.userName[0]).toUpperCase(),
                            style: TextStyle(
                              color: ThemeSelector.colors.onSecondary,
                              fontSize: ThemeSelector.fonts.font_38,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultGap),
                  Text(
                    state.user.userName.capitalize(),
                    style: TextStyle(
                        color: ThemeSelector.colors.secondary,
                        fontSize: ThemeSelector.fonts.font_18,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(ThemeSelector.statics.defaultTitleGap,
                            ThemeSelector.statics.defaultTitleGap),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft),
                    onPressed: () {
                      showAlertDialog(
                          context: context,
                          title: Container(),
                          content: const ProfileForm(),
                          actionWidgets: [const FormSubmitButtons()]);
                    },
                    child: Center(
                        child: SvgPicture.asset('assets/images/edit.svg')),
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultGap),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var menuItem in AppMenuList.appList(context))
                            MenuButton(menuItem: menuItem),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<UserBloc>()
                                  .add(UserFromJsonEvent(user: UserModel()));
                              context.router.replaceAll([LoginRoute()]);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).logOut,
                                  style: TextStyle(
                                    color: ThemeSelector.colors.secondary,
                                    fontSize: ThemeSelector.fonts.font_14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                    width: ThemeSelector.statics.defaultGap),
                                SvgPicture.asset(
                                    'assets/images/logout_menu.svg'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    S.of(context).yumi.toUpperCase(),
                    style: TextStyle(
                      color: ThemeSelector.colors.primary,
                      fontSize: ThemeSelector.fonts.font_12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultGap),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
