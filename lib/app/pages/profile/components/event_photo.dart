import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

class EventsPhoto extends StatelessWidget {
  const EventsPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return FormField<List<String?>>(
      validator: (value) =>
          value == null || value.isEmpty ? "Upload at least one photo" : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: G().rd<ProfileCubit>().state.form.eventPhotos,
      builder: (fieldState) => BlocBuilder<ProfileCubit, ProfileState>(
        builder: (ctx, state) {
          var eventPhotosTitle = Row(
            children: [
              SvgPicture.asset('assets/images/camera_dark.svg'),
              const SizedBox(width: CommonDimens.defaultLineGap),
              Text(
                S.of(ctx).eventsPhoto,
                style: Theme.of(ctx).textTheme.labelLarge,
              ),
            ],
          );

          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonDimens.defaultTitleGap),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                eventPhotosTitle,
                if (state.form.eventPhotosCount < 5)
                  Row(
                    children: [
                      const SizedBox(width: CommonDimens.defaultLineGap),
                      const SizedBox(width: CommonDimens.defaultLineGap),
                      Text(
                        S.of(context).maxImageSize,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                const SizedBox(height: CommonDimens.defaultGap * 2),
                Flexible(
                  fit: FlexFit.loose,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (state.form.eventPhotosCount < 5)
                          _photoCard(fieldState, state),
                        ...state.form.eventPhotos
                            .map((e) => _photoCard(fieldState, state, e)),
                      ],
                    ),
                  ),
                ),
                if (fieldState.hasError)
                  const SizedBox(height: CommonDimens.defaultGap),
                if (fieldState.hasError)
                  Text(
                    fieldState.errorText ?? '',
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Card _photoCard(
    FormFieldState<List<String?>> fieldState,
    ProfileState state, [
    String? image,
  ]) {
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
                      Uri.parse(image).data?.contentAsBytes() ?? Uint8List(0),
                      height: h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              _deleteButton(fieldState, image)
            ] else if (state.form.entityStatus.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              _addButton(fieldState, state),
          ],
        ),
      ),
    );
  }

  Widget _addButton(
    FormFieldState<List<String?>> fieldState,
    ProfileState state,
  ) {
    return Center(
      child: IconButton(
          onPressed: () async {
            ImagePicker picker = ImagePicker();

            final images = await picker.pickMultiImage();

            b64e(XFile fl) async =>
                'data:${lookupMimeType(fl.path)};base64,${base64Encode(await fl.readAsBytes())}';
            var newPhotos = await Future.wait(images.map((e) => b64e(e)));

            if (newPhotos.isEmpty) return;

            List<String?> photos = [
              ...state.form.eventPhotos,
              ...newPhotos,
            ];

            var allowed = 5 - state.form.eventPhotos.length;

            if (photos.length <= 5) {
              final p = await G().rd<ProfileCubit>().uploadFormPhotos(photos);
              G().rd<ProfileCubit>().getProfileForm();

              if (!fieldState.mounted) return;
              return fieldState.didChange(p.eventPhotos);
            }

            showAlertDialog(
              // ignore: use_build_context_synchronously
              context: G().context,
              content: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "You're only allowed to upload a total of 5 photos.\n\n "
                  "${allowed > 0 ? 'You\'ve selected ${newPhotos.length} of which $allowed ${allowed > 1 ? "photos" : "photo"} will be uploaded.' : 'no more photos can be uploaded.'}",
                ),
              ),
              actions: {
                if (allowed > 0)
                  S.current.cancel: (ctx) => ctx.router.popForced(),
                S.current.ok: (ctx) {
                  final p = G().rd<ProfileCubit>().uploadFormPhotos(photos);
                  fieldState.didChange(photos);
                  ctx.router.popForced();
                },
              },
            );
          },
          icon: const Icon(Icons.add)),
    );
  }

  Widget _deleteButton(
    FormFieldState<List<String?>> fieldState,
    String? image,
  ) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: InkWell(
        onTap: () {
          showAlertDialog(
              context: G().context,
              content: const Padding(
                padding: EdgeInsets.all(12),
                child: Text("Are you sure you want ot delete selected image"),
              ),
              actions: {
                S.current.cancel: null,
                S.current.ok: (ctx) async {
                  G().pop();
                  final p = await G()
                      .rd<ProfileCubit>()
                      .deleteFormPhoto(photo: image!);
                  fieldState.didChange(p.eventPhotos);
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
                color: CommonColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
