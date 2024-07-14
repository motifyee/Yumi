import 'dart:convert';
import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:yumi/generated/l10n.dart';

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
        //   color: CommonColors.secondary,
        //   width: 2,
        // ),
        borderRadius: BorderRadius.circular(
          CommonDimens.defaultBorderRadiusExtreme,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(CommonDimens.iconSizeLarge),
        onTap: () async {
          ImagePicker picker = ImagePicker();

          final image = !multi
              ? await picker.pickImage(source: ImageSource.gallery)
              : null;
          final images = multi ? await picker.pickMultiImage() : null;

          b64e(XFile fl) async =>
              'data:${lookupMimeType(fl.path)};base64,${base64Encode(await fl.readAsBytes())}';

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
              padding: EdgeInsets.all(padding ?? CommonDimens.defaultGap),
              width: size ?? CommonDimens.iconSizeExtreme,
              height: size ?? CommonDimens.iconSizeExtreme,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CommonDimens.iconSizeLarge),
                border: (borderWidth ?? 1) > 0
                    ? Border.fromBorderSide(BorderSide(
                        width: defaultImage != null
                            ? 0
                            : borderWidth ?? CommonDimens.defaultGap,
                        color: CommonColors.primary,
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
                  const SizedBox(height: CommonDimens.defaultGap),
                  Text(
                    S.of(context).upload,
                    style: TextStyle(
                      color: CommonColors.secondary,
                      fontSize: CommonFontSize.font_10,
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
