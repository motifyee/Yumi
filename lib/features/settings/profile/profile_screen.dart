import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/features/settings/profile/model/profile_model.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bio.dart';
import 'package:yumi/template/event_photo.dart';
import 'package:yumi/template/loading.dart';
import 'package:yumi/template/my_reviews.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/upload_photo_button.dart';

Widget profileImagePicker(BuildContext context, Profile profile, bool loading) {
  if (loading) return Loading();

  return Container(
    width: ThemeSelector.statics.defaultBorderRadiusExtreme * 1.3,
    height: ThemeSelector.statics.defaultBorderRadiusExtreme * 1.3,
    // padding: EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
    decoration: BoxDecoration(
      // border: Border.all(
      //   color: ThemeSelector.colors.secondary,
      //   width: 2,
      // ),
      color: ThemeSelector.colors.onSecondary,
      borderRadius: BorderRadius.circular(
        ThemeSelector.statics.defaultBorderRadiusExtreme,
      ),
    ),
    child: UploadPhotoButton(
      defaultImage: profile.profileImage,
      borderWidth: 0,
      title: null,
      size: ThemeSelector.statics.iconSizeExtreme * 2.3,
      onPressed: (image) async {
        final newProfile = profile.copyWith(profileImage: image);

        G.cContext.read<ProfileBloc>().add(ProfileLoadingEvent());

        G.cContext
            .read<ProfileBloc>()
            .add(ProfileUpdateEvent(context: context, profile: newProfile));
      },
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  final bool isSheet;
  const ProfileScreen({super.key, this.isSheet = false});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(ProfileInitEvent(context: context));

    return Column(
      children: [
        const ProfilePicture(),
        if (isSheet)
          bottom()
        else
          Expanded(
            child: SingleChildScrollView(
              child: bottom(),
            ),
          ),
      ],
    );
  }

  Column bottom() {
    return Column(
      children: [
        const Bio(),
        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
        const EventsPhoto(),
        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
        if (!isSheet) const MyReviews(),
      ],
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingEvent) return Loading();
        var profile = state.profile;

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
            // Expanded(
            //   // child: bottom(),
            //   child: isSheet
            //       ? bottom()
            //       : SingleChildScrollView(
            //           child: bottom(),
            //         ),
            // ),
          ],
        );
      },
    );
  }
}
