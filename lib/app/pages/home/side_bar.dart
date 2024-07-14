import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/settings/components/profile/profile_form.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/app_info/app_info_cubit.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/extensions/capitalize_string_extension.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/side_menu_items.dart';
import 'package:yumi/app/pages/home/menu_button.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppInfoCubit>().getAppInfo();
    return BlocBuilder<UserCubit, UserState>(
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
              padding: const EdgeInsets.only(
                top: CommonDimens.defaultTitleGap,
                left: CommonDimens.defaultBlockGap,
                right: CommonDimens.defaultBlockGap,
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
                  const SizedBox(height: CommonDimens.defaultGap),
                  Container(
                    padding: const EdgeInsets.all(CommonDimens.defaultGap),
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(
                          width: 3,
                          color: CommonColors.primary,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                          CommonDimens.defaultBorderRadiusExtreme),
                      color: CommonColors.onPrimary,
                    ),
                    child: GestureDetector(
                      onTap: () {
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
                          color: CommonColors.secondary,
                          borderRadius: BorderRadius.circular(
                              CommonDimens.defaultBorderRadiusExtreme),
                        ),
                        child: Center(
                          child: Text(
                            state.user.userName.isEmpty
                                ? ''
                                : (state.user.userName[0]).toUpperCase(),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: CommonFontSize.font_38,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: CommonDimens.defaultGap),
                  Text(
                    state.user.userName.capitalize(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: CommonFontSize.font_18,
                        ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(CommonDimens.defaultTitleGap,
                            CommonDimens.defaultTitleGap),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft),
                    onPressed: () {
                      showAlertDialog(
                          context: context,
                          title: Container(),
                          content: const ProfileForm(),
                          actions: {'Cancel': null},
                          actionWidgets: [const ProfileFormSubmitButton()]);
                    },
                    child: Center(
                        child: SvgPicture.asset('assets/images/edit.svg')),
                  ),
                  const SizedBox(height: CommonDimens.defaultGap),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var menuItem in AppMenuList.appList(context))
                            MenuButton(menuItem: menuItem),
                          //
                          const SizedBox(height: 40),
                          TextButton(
                            onPressed: () {
                              context.read<UserCubit>().reset();
                              context.router.replaceAll([const LoginRoute()]);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).logOut,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(width: CommonDimens.defaultGap),
                                SvgPicture.asset(
                                    'assets/images/logout_menu.svg'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).yumi.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const Text(' '),
                      if (AppTarget.user == YumiApp.chefs)
                        SvgPicture.asset(
                          'assets/images/welocme_chef_icon.svg',
                          height: CommonFontSize.font_12,
                          colorFilter: ColorFilter.mode(
                              CommonColors.primary, BlendMode.srcIn),
                        ),
                      if (AppTarget.user == YumiApp.drivers)
                        SvgPicture.asset(
                          'assets/images/welcom_driver_icon.svg',
                          height: CommonFontSize.font_12,
                          colorFilter: ColorFilter.mode(
                              CommonColors.primary, BlendMode.srcIn),
                        ),
                    ],
                  ),
                  BlocBuilder<AppInfoCubit, AppInfoState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).maxImageSize,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(
                            '${state.packageInfo?.version}+${state.packageInfo?.buildNumber}v',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: CommonDimens.defaultGap),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
