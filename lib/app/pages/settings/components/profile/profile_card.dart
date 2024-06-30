import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/components/profile/profile_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/dialog.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    // if (cubit.state.profile.guid.isEmpty)
    cubit.getProfile();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final titleRow = Row(
          children: [
            SvgPicture.asset(
              'assets/images/profile.svg',
              colorFilter: ColorFilter.mode(
                  ThemeSelector.colors.secondary, BlendMode.srcIn),
            ),
            SizedBox(width: ThemeSelector.statics.defaultGap),
            Text(S.of(context).profileSettings),
            const Expanded(child: Text('')),
            TextButton(
                onPressed: () {
                  showAlertDialog(
                      context: context,
                      title: Container(),
                      content: const ProfileForm(),
                      actions: {'Cancel': null},
                      actionWidgets: [const ProfileFormSubmitButton()]);
                },
                child: Text(
                  S.of(context).edit,
                  style: Theme.of(context).textTheme.bodyMedium,
                ))
          ],
        );

        final fullNameRow = Row(
          children: [
            Text(
              S.of(context).fullName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Expanded(child: Text('')),
            Text(
              state.profile.fullName,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ThemeSelector.colors.secondaryTant),
            ),
          ],
        );

        final userNameRow = Row(
          children: [
            Text(
              S.of(context).userName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Expanded(child: Text('')),
            Text(
              state.profile.userName,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ThemeSelector.colors.secondaryTant),
            ),
          ],
        );

        final phoneRow = Row(
          children: [
            Text(
              S.of(context).phone,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Expanded(child: Text('')),
            Text(
              state.profile.mobile,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ThemeSelector.colors.secondaryTant),
            ),
          ],
        );

        final addressRow = Row(
          children: [
            Text(
              S.of(context).address,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Expanded(child: Text('')),
            Text(
              state.profile.address,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ThemeSelector.colors.secondaryTant),
            ),
          ],
        );

        final aboutRow = Row(
          children: [
            Text(
              S.of(context).about,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Expanded(child: Text('')),
            Text(
              state.profile.about,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ThemeSelector.colors.secondaryTant),
            ),
          ],
        );

        final deliveryAndPickupIconsRow = Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 60,
              child: SvgPicture.asset('assets/images/pickup-available.svg'),
            ),
            SizedBox(
              height: 60,
              child: SvgPicture.asset(
                  'assets/images/delivery-${state.profile.pickupOnly ? 'not-' : ''}available.svg'),
            ),
          ],
        );

        const spinner = SizedBox(
          height: 150,
          child: Center(child: CircularProgressIndicator()),
        );

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
              children: state.profile.entityStatus.isLoading
                  ? [spinner]
                  : [
                      titleRow,
                      SizedBox(height: ThemeSelector.statics.defaultLineGap),
                      fullNameRow,
                      SizedBox(height: ThemeSelector.statics.defaultGap),
                      userNameRow,
                      SizedBox(height: ThemeSelector.statics.defaultGap),
                      phoneRow,
                      SizedBox(height: ThemeSelector.statics.defaultGap),
                      addressRow,
                      if (!G.isCustomerApp)
                        SizedBox(height: ThemeSelector.statics.defaultGap),
                      if (!G.isCustomerApp) aboutRow,
                      SizedBox(height: ThemeSelector.statics.defaultGap),
                      // pickup allowed
                      if (G.isChefApp) deliveryAndPickupIconsRow,
                    ],
            ),
          ),
        );
      },
    );
  }
}
