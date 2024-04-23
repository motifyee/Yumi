import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/upload_photo_button.dart';

class EventsPhoto extends StatelessWidget {
  const EventsPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (ctx, state) {
        if (state.status.isSaved) {
          ctx.read<ProfileBloc>().add(
              ProfileUpdateEvent(context: context, profile: state.profile));
        }
      },
      builder: (ctx, state) {
        var eventPhotosTitle = Row(
          children: [
            SvgPicture.asset('assets/images/camera_dark.svg'),
            SizedBox(width: ThemeSelector.statics.defaultLineGap),
            Text(
              S.of(ctx).eventsPhoto,
              style: Theme.of(ctx).textTheme.labelLarge,
            ),
          ],
        );

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultTitleGap),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              eventPhotosTitle,
              SizedBox(height: ThemeSelector.statics.defaultGap * 2),
              Flexible(
                fit: FlexFit.loose,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (state.profile.eventPhotosCount < 5)
                        _photoCard(ctx, state),
                      ...state.profile.eventPhotos
                          .map((e) => _photoCard(ctx, state, e)),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Card _photoCard(BuildContext ctx, ProfileState state, [String? image]) {
    var w = 120.0;
    var h = 200.0;
    return Card(
      elevation: 3,
      child: SizedBox(
        // padding: const EdgeInsets.all(5),
        height: h,
        width: image != null && image.isNotEmpty ? null : w,
        // alignment: Alignment.center,
        child: Stack(
          children: [
            if (image != null && image.isNotEmpty) ...[
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: w * 2),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.memory(
                      base64Decode(image),
                      height: h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              _deleteButton(ctx, image)
            ] else if (state.status.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              _addButton(ctx, state),
          ],
        ),
      ),
    );
  }

  Widget _addButton(BuildContext ctx, ProfileState state) {
    return Center(
      child: IconButton(
          onPressed: () async {
            ImagePicker picker = ImagePicker();

            final images = await picker.pickMultiImage();

            b64e(XFile fl) async => base64Encode(await fl.readAsBytes());
            var newPhotos = await Future.wait(images.map((e) => b64e(e)));

            if (newPhotos.isEmpty) return;

            List<String?> photos = [
              ...state.profile.eventPhotos,
              ...newPhotos,
            ];

            var allowed = 5 - state.profile.eventPhotos.length;

            if (!ctx.mounted) return;

            if (photos.length <= 5) {
              ctx.read<ProfileBloc>().add(ProfileUploadPhotosEvent(photos));
              return;
            }

            showAlertDialog(
              context: ctx,
              content: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "You're only allowed to upload a total of 5 photos.\n\n "
                  "${allowed > 0 ? 'You\'ve selected ${newPhotos.length} of which $allowed ${allowed > 1 ? "photos" : "photo"} will be uploaded.' : 'no more photos can be uploaded.'}",
                ),
              ),
              actions: {
                if (allowed > 0) 'Cancel': (ctx) => ctx.router.popForced(),
                'Ok': (ctx) {
                  ctx.read<ProfileBloc>().add(ProfileUploadPhotosEvent(photos));
                  ctx.router.popForced();
                },
              },
            );
          },
          icon: const Icon(Icons.add)),
    );
  }

  Widget _deleteButton(BuildContext ctx, String? image) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: InkWell(
        onTap: () {
          showAlertDialog(
              context: ctx,
              content: const Padding(
                padding: EdgeInsets.all(12),
                child: Text("Are you sure you want ot delete selected image"),
              ),
              actions: {
                'Cancel': null,
                'Ok': (ctx) {
                  G.pop();
                  ctx.read<ProfileBloc>().add(ProfileDeletePhotoEvent(image!));
                  // ctx.router.pop();
                }
              });
        },
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomRight: Radius.circular(10),
            ),
          ),
          height: 35,
          width: 35,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Icon(
                Icons.close,
                size: 15,
                color: ThemeSelector.colors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
