import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/components/profile/profile_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

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
              colorFilter:
                  ColorFilter.mode(CommonColors.secondary, BlendMode.srcIn),
            ),
            const SizedBox(width: CommonDimens.defaultGap),
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
                  ?.copyWith(color: CommonColors.secondaryTant),
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
                  ?.copyWith(color: CommonColors.secondaryTant),
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
                  ?.copyWith(color: CommonColors.secondaryTant),
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
                  ?.copyWith(color: CommonColors.secondaryTant),
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
                  ?.copyWith(color: CommonColors.secondaryTant),
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

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(CommonDimens.defaultLineGap),
          decoration: BoxDecoration(
            color: CommonColors.background,
            borderRadius:
                BorderRadius.circular(CommonDimens.defaultBorderRadiusSmall),
            boxShadow: [
              BoxShadow(
                color: CommonColors.secondary.withOpacity(.15),
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
                    const SizedBox(height: CommonDimens.defaultLineGap),
                    fullNameRow,
                    const SizedBox(height: CommonDimens.defaultGap),
                    userNameRow,
                    const SizedBox(height: CommonDimens.defaultGap),
                    phoneRow,
                    const SizedBox(height: CommonDimens.defaultGap),
                    addressRow,
                    if (!G().isCustomerApp)
                      const SizedBox(height: CommonDimens.defaultGap),
                    if (!G().isCustomerApp) aboutRow,
                    const SizedBox(height: CommonDimens.defaultGap),
                    // pickup allowed
                    if (G().isChefApp) deliveryAndPickupIconsRow,
                  ],
          ),
        );
      },
    );
  }
}
