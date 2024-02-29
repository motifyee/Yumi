import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/forms/profile_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';

class UserSettingDetails extends StatelessWidget {
  const UserSettingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: ThemeSelector.statics.defaultTitleGap,
            right: ThemeSelector.statics.defaultTitleGap,
            left: ThemeSelector.statics.defaultTitleGap,
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(ThemeSelector.statics.defaultLineGap),
            decoration: BoxDecoration(
              color: ThemeSelector.colors.background,
              borderRadius: BorderRadius.circular(
                  ThemeSelector.statics.defaultBorderRadiusSmall),
              boxShadow: [
                BoxShadow(
                  color: ThemeSelector.colors.secondary.withOpacity(.15),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(2, 4),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/profile.svg',
                      colorFilter: ColorFilter.mode(
                          ThemeSelector.colors.secondary, BlendMode.srcIn),
                    ),
                    SizedBox(width: ThemeSelector.statics.defaultGap),
                    Text(S.of(context).profileSetting),
                    const Expanded(child: Text('')),
                    TextButton(
                        onPressed: () {
                          showAlertDialog(
                              context: context,
                              title: Container(),
                              content: const ProfileForm(),
                              // actions: {'Ok': null}
                              actionWidgets: [const FormSubmitButtons()]
                              // actionWidgets: [
                              //   // Expanded(child: Container()),
                              //   TextButton(
                              //     style: TextButton.styleFrom(
                              //       textStyle:
                              //           Theme.of(context).textTheme.labelLarge,
                              //     ),
                              //     child: const Text('Cancel'),
                              //     onPressed: () {
                              //       Navigator.of(context).pop();
                              //     },
                              //   ),
                              //   TextButton(
                              //     style: TextButton.styleFrom(
                              //       textStyle:
                              //           Theme.of(context).textTheme.labelLarge,
                              //     ),
                              //     child: const Text('Save'),
                              //     onPressed: () {
                              //       Navigator.of(context).pop();
                              //     },
                              //   ),
                              // ],
                              );
                        },
                        child: Text(
                          S.of(context).edit,
                          style:
                              TextStyle(color: ThemeSelector.colors.secondary),
                        ))
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                Row(
                  children: [
                    Text(
                      S.of(context).fullName,
                      style: TextStyle(color: ThemeSelector.colors.secondary),
                    ),
                    const Expanded(child: Text('')),
                    Text(
                      state.profile.fullName,
                      style:
                          TextStyle(color: ThemeSelector.colors.secondaryTant),
                    ),
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.defaultGap),
                Row(
                  children: [
                    Text(
                      S.of(context).userName,
                      style: TextStyle(color: ThemeSelector.colors.secondary),
                    ),
                    const Expanded(child: Text('')),
                    Text(
                      state.profile.userName,
                      style:
                          TextStyle(color: ThemeSelector.colors.secondaryTant),
                    ),
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.defaultGap),
                Row(
                  children: [
                    Text(
                      S.of(context).phone,
                      style: TextStyle(color: ThemeSelector.colors.secondary),
                    ),
                    const Expanded(child: Text('')),
                    Text(
                      state.profile.mobile,
                      style:
                          TextStyle(color: ThemeSelector.colors.secondaryTant),
                    ),
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.defaultGap),
                Row(
                  children: [
                    Text(
                      S.of(context).address,
                      style: TextStyle(color: ThemeSelector.colors.secondary),
                    ),
                    const Expanded(child: Text('')),
                    Text(
                      state.profile.country.name,
                      style:
                          TextStyle(color: ThemeSelector.colors.secondaryTant),
                    ),
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.defaultGap),
                Row(
                  children: [
                    Text(
                      S.of(context).pickup,
                      style: TextStyle(color: ThemeSelector.colors.secondary),
                    ),
                    const Expanded(child: Text('')),
                    Text(
                      state.profile.pickup ? 'Allowed' : 'Not Allowed',
                      style:
                          TextStyle(color: ThemeSelector.colors.secondaryTant),
                    ),
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.defaultGap),
                Row(
                  children: [
                    Text(
                      S.of(context).about,
                      style: TextStyle(color: ThemeSelector.colors.secondary),
                    ),
                    const Expanded(child: Text('')),
                    Text(
                      state.profile.about,
                      style:
                          TextStyle(color: ThemeSelector.colors.secondaryTant),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
