import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/profile/profile_screen.dart';
import 'package:yumi/domain/profile/profile.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/app/pages/profile/components/bio.dart';
import 'package:yumi/app/pages/profile/components/event_photo.dart';

class EditBioSheet extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  EditBioSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // !Bug build so much
    if (!G().rd<ProfileCubit>().state.form.entityStatus.hasSuccess) {
      context.read<ProfileCubit>().getProfileForm();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.only(
          left: CommonDimens.defaultBlockGap,
          right: CommonDimens.defaultBlockGap,
          top: CommonDimens.defaultGapExtreme,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: CommonColors.background,
          borderRadius: const BorderRadius.only(
            topRight:
                Radius.circular(CommonDimens.defaultBorderRadiusExtraLarge),
            topLeft:
                Radius.circular(CommonDimens.defaultBorderRadiusExtraLarge),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
        child: SizedBox(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const ProfilePicture(),
                  const Bio(),
                  if (G().isChefApp) const SizedBox(height: 40),
                  if (G().isChefApp) const EventsPhoto(),
                  const SizedBox(height: 20),
                  BlocSelector<ProfileCubit, ProfileState, bool>(
                    selector: (state) => state.form.profileSheetDone,
                    builder: (context, profileSheetDone) {
                      return TextButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) return;

                          var state = G().rd<ProfileCubit>().state;
                          if (!state.form.profileSheetDone) return;

                          Navigator.of(context).pop();
                          G().rd<RegCubit>().refresh();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: profileSheetDone
                              ? CommonColors.primary
                              : CommonColors.secondary,
                        ),
                        child: Text(S.of(context).ok),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // },
          ),
        ),
      ),
    );
  }
}
