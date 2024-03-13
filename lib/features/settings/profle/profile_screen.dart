import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/settings/profle/bloc/profile_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/profile_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bio.dart';
import 'package:yumi/template/event_photo.dart';
import 'package:yumi/template/loading.dart';
import 'package:yumi/template/my_reviews.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/upload_photo_button.dart';

Widget profileImagePicker(BuildContext context, Profile profile, bool loading) {
  if (loading) return Loading();

  return TextButton(
    onPressed: () {},
    child: Container(
      width: ThemeSelector.statics.defaultBorderRadiusExtreme * 1.3,
      height: ThemeSelector.statics.defaultBorderRadiusExtreme * 1.3,
      padding: EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
      decoration: BoxDecoration(
        color: ThemeSelector.colors.onSecondary,
        borderRadius: BorderRadius.circular(
            ThemeSelector.statics.defaultBorderRadiusExtreme),
      ),
      child: UploadPhotoButton(
        defaultImage: profile.profileImage,
        borderWidth: 0,
        title: null,
        size: ThemeSelector.statics.iconSizeExtreme * 1.3,
        onPressed: (image) async {
          final newProfile = profile.copyWith(profileImage: image);

          context.read<ProfileBloc>().add(ProfileLoadingEvent());

          context
              .read<ProfileBloc>()
              .add(ProfileUpdateEvent(context: context, profile: newProfile));
        },
      ),
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(ProfileInitEvent(context: context));

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingEvent) return Loading();

        var profile = state.profile;

        // if (state is ProfileFormInitialState) profile = state.profile;
        // if (state is ProfileFormUpdatedState) profile = state.profile;

        return Column(
          children: [
            profileImagePicker(context, profile, state is ProfileLoadingEvent),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            Text(
              profile.fullName,
              style: TextStyle(
                  color: ThemeSelector.colors.primary,
                  fontSize: ThemeSelector.fonts.font_24),
            ),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('4.5',
                    style: TextStyle(color: ThemeSelector.colors.secondary)),
                Text(' ',
                    style: TextStyle(color: ThemeSelector.colors.secondary)),
                SvgPicture.asset('assets/images/star.svg'),
                if (state.profile.isHygiene)
                  Text(' | ${S.of(context).hygiene}',
                      style: TextStyle(color: ThemeSelector.colors.secondary)),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultTitleGap),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Bio(),
                    SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                    const EventsPhoto(),
                    SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                    const MyReviews(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
