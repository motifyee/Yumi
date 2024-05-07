import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class UploadPhotoButton extends StatelessWidget {
  double? borderWidth;
  double? size;
  double? padding;
  String? title;
  bool multi;
  UploadPhotoButton({
    super.key,
    required this.onPressed,
    this.defaultImage,
    this.borderWidth,
    this.size,
    this.padding,
    this.title = 'Upload',
    this.multi = false,
  });

  final Function(dynamic) onPressed;
  String? defaultImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: ThemeSelector.colors.secondary,
        //   width: 2,
        // ),
        borderRadius: BorderRadius.circular(
          ThemeSelector.statics.defaultBorderRadiusExtreme,
        ),
      ),
      child: InkWell(
        borderRadius:
            BorderRadius.circular(ThemeSelector.statics.iconSizeLarge),
        onTap: () async {
          ImagePicker picker = ImagePicker();

          final image = !multi
              ? await picker.pickImage(source: ImageSource.gallery)
              : null;
          final images = multi ? await picker.pickMultiImage() : null;
          // TODO: use mimi package to get file mimi to replace "image/jpeg"
          b64e(XFile fl) async =>
              'data:image/jpeg;base64,${base64Encode(await fl.readAsBytes())}';

          var blob = image != null ? await b64e(image) : null;
          var blobs = images != null
              ? await Future.wait(images.map((e) async => await b64e(e)))
              : null;

          onPressed(blob ?? blobs);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.all(padding ?? ThemeSelector.statics.defaultGap),
              width: size ?? ThemeSelector.statics.iconSizeExtreme,
              height: size ?? ThemeSelector.statics.iconSizeExtreme,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ThemeSelector.statics.iconSizeLarge),
                border: (borderWidth ?? 1) > 0
                    ? Border.fromBorderSide(BorderSide(
                        width: defaultImage != null
                            ? 0
                            : borderWidth ?? ThemeSelector.statics.defaultGap,
                        color: ThemeSelector.colors.primary,
                      ))
                    : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120.0),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(120),
                  child: defaultImage != null
                      ? Image.memory(
                          Uri.parse(defaultImage ?? '')
                                  .data
                                  ?.contentAsBytes() ??
                              Uint8List(0),
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset('assets/images/camera.svg'),
                ),
              ),
            ),
            if (title != null)
              Column(
                children: [
                  SizedBox(height: ThemeSelector.statics.defaultGap),
                  Text(
                    S.of(context).upload,
                    style: TextStyle(
                      color: ThemeSelector.colors.secondary,
                      fontSize: ThemeSelector.fonts.font_10,
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
