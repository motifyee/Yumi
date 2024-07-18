import 'package:common_code/common_code.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/profile/components/my_reviews.dart';
import 'package:yumi/global.dart';
import 'package:yumi/app/pages/profile/components/bio.dart';
import 'package:yumi/app/pages/profile/components/event_photo.dart';
import 'package:yumi/app/pages/profile/components/upload_photo_button.dart';

Widget profileImagePicker(
  BuildContext context,
  String? profileImage,
  bool loading,
  FormFieldState<String> fieldState,
) {
  if (loading) return const PacmanLoadingWidget();

  return Container(
    // width: CommonDimens.defaultBorderRadiusExtreme * 1.3,
    // height: CommonDimens.defaultBorderRadiusExtreme * 1.3,
    decoration: BoxDecoration(
      color: CommonColors.onSecondary,
      borderRadius: BorderRadius.circular(
        CommonDimens.defaultBorderRadiusExtreme,
      ),
    ),
    child: UploadPhotoButton(
      defaultImage: profileImage,
      borderWidth: 0,
      title: null,
      size: CommonDimens.iconSizeExtreme * 2.3,
      onPressed: (image) async {
        if (image == null) return;

        final p = await G().rd<ProfileCubit>().updateProfilePhoto(image);
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
        const SizedBox(height: CommonDimens.defaultBlockGap),
        if (G().isChefApp) const EventsPhoto(),
        const SizedBox(height: CommonDimens.defaultBlockGap),
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
      initialValue: G().rd<ProfileCubit>().state.form.profileImage,
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
            return const PacmanLoadingWidget();
          }

          return Column(
            children: [
              profileImagePicker(
                context,
                profileState.photo,
                profileState.entityStatus.isLoading,
                fieldState,
              ),
              const SizedBox(height: CommonDimens.defaultGap),
              if (fieldState.hasError)
                Text(
                  fieldState.errorText ?? "",
                  style: const TextStyle(color: Colors.red),
                ),
              Text(
                profileState.fullName,
                style: TextStyle(
                    color: CommonColors.primary,
                    fontSize: CommonFontSize.font_24),
              ),
              const SizedBox(height: CommonDimens.defaultGap),
              // rating bar
              if (!G().rd<RegCubit>().state.registerationStarted)
                SizedBox(
                  width: 50,
                  child: RatingContainer(rate: profileState.rate),
                ),
              const SizedBox(height: CommonDimens.defaultTitleGap),
            ],
          );
        },
      ),
    );
  }
}
