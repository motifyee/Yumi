import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bio.dart';
import 'package:yumi/template/event_photo.dart';
import 'package:yumi/template/loading.dart';
import 'package:yumi/app/pages/settings/profile/reviews.dart';
import 'package:yumi/template/upload_photo_button.dart';

Widget profileImagePicker(
    BuildContext context, String? profileImage, bool loading) {
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
      defaultImage: profileImage,
      borderWidth: 0,
      title: null,
      size: ThemeSelector.statics.iconSizeExtreme * 2.3,
      onPressed: (image) async {
        if (image == null) return;

        G.rd<ProfileCubit>().updateProfilePhoto(image);
      },
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  final bool isSheet;
  const ProfileScreen({super.key, this.isSheet = false});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfileForm();
    context.read<ProfileCubit>().getReviews();

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
        if (G.isChefApp) const EventsPhoto(),
        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
        if (!isSheet) const MyReviews(),
      ],
    );
  }
}

class ProfilePhotoSlice extends Equatable {
  final String? photo;
  final bool isHygiene;
  final String fullName;
  final EntityStatus entityStatus;

  const ProfilePhotoSlice({
    required this.photo,
    required this.isHygiene,
    required this.fullName,
    required this.entityStatus,
  });

  @override
  List<Object?> get props => [photo, isHygiene, fullName, entityStatus];
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, ProfilePhotoSlice>(
      selector: (state) => ProfilePhotoSlice(
        photo: state.form.profileImage,
        isHygiene: state.form.isHygiene,
        fullName: state.form.fullName,
        entityStatus: state.form.entityStatus,
      ),
      builder: (context, state) {
        if (state.photo == null && state.entityStatus.isLoading) {
          return Loading();
        }

        return Column(
          children: [
            profileImagePicker(
                context, state.photo, state.entityStatus.isLoading),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            Text(
              state.fullName,
              style: TextStyle(
                  color: ThemeSelector.colors.primary,
                  fontSize: ThemeSelector.fonts.font_24),
            ),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            if (!G.rd<RegCubit>().state.registerationStarted)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('4.5',
                      style: TextStyle(color: ThemeSelector.colors.secondary)),
                  Text(' ',
                      style: TextStyle(color: ThemeSelector.colors.secondary)),
                  SvgPicture.asset('assets/images/star.svg'),
                  if (state.isHygiene)
                    Text(' | ${S.of(context).hygiene}',
                        style:
                            TextStyle(color: ThemeSelector.colors.secondary)),
                ],
              ),
            SizedBox(height: ThemeSelector.statics.defaultTitleGap),
          ],
        );
      },
    );
  }
}
