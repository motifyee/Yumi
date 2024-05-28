import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/profile/reviews.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bio.dart';
import 'package:yumi/template/event_photo.dart';
import 'package:yumi/template/upload_photo_button.dart';

Widget profileImagePicker(
  BuildContext context,
  String? profileImage,
  bool loading,
  FormFieldState<String> fieldState,
) {
  if (loading) return Loading();

  return Container(
    // width: ThemeSelector.statics.defaultBorderRadiusExtreme * 1.3,
    // height: ThemeSelector.statics.defaultBorderRadiusExtreme * 1.3,
    decoration: BoxDecoration(
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

        final p = await G.rd<ProfileCubit>().updateProfilePhoto(image);
        fieldState.didChange(p.profileImage);
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
  final double rate;

  const ProfilePhotoSlice({
    required this.photo,
    required this.isHygiene,
    required this.fullName,
    required this.entityStatus,
    required this.rate,
  });

  @override
  List<Object?> get props => [photo, isHygiene, fullName, entityStatus];
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: G.rd<ProfileCubit>().state.form.profileImage,
      validator: (value) => value == null || value.trim().isEmpty
          ? 'Please select a profile photo'
          : null,
      builder: (fieldState) =>
          BlocSelector<ProfileCubit, ProfileState, ProfilePhotoSlice>(
        selector: (state) => ProfilePhotoSlice(
          photo: state.form.profileImage,
          isHygiene: state.form.isHygiene,
          fullName: state.form.fullName,
          entityStatus: state.form.entityStatus,
          rate: state.form.rate,
        ),
        builder: (context, profileState) {
          if (profileState.photo == null &&
              profileState.entityStatus.isLoading) {
            return Loading();
          }

          return Column(
            children: [
              profileImagePicker(
                context,
                profileState.photo,
                profileState.entityStatus.isLoading,
                fieldState,
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              if (fieldState.hasError)
                Text(
                  fieldState.errorText ?? "",
                  style: const TextStyle(color: Colors.red),
                ),
              Text(
                profileState.fullName,
                style: TextStyle(
                    color: ThemeSelector.colors.primary,
                    fontSize: ThemeSelector.fonts.font_24),
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              // rating bar
              if (!G.rd<RegCubit>().state.registerationStarted)
                SizedBox(
                  width: 50,
                  child: RatingContainer(rate: profileState.rate),
                ),
              SizedBox(height: ThemeSelector.statics.defaultTitleGap),
            ],
          );
        },
      ),
    );
  }
}
