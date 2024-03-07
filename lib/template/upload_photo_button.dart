import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class UploadPhotoButton extends StatelessWidget {
  UploadPhotoButton({super.key, required this.onPressed, this.defaultImage});

  final Function(dynamic) onPressed;
  String? defaultImage;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        ImagePicker imagePicker = ImagePicker();
        final image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) {
          onPressed(image);
        } else {
          var blob = base64Encode(await image.readAsBytes());
          onPressed(blob);
        }
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
            width: ThemeSelector.statics.iconSizeExtreme,
            height: ThemeSelector.statics.iconSizeExtreme,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ThemeSelector.statics.iconSizeLarge),
                border: Border.fromBorderSide(BorderSide(
                  width: defaultImage != null
                      ? 0
                      : ThemeSelector.statics.defaultGap,
                  color: ThemeSelector.colors.primary,
                ))),
            child: defaultImage != null
                ? Image.memory(base64Decode(defaultImage ?? ''))
                : SvgPicture.asset('assets/images/camera.svg'),
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          Text(
            S.of(context).upload,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: ThemeSelector.fonts.font_10,
                ),
          )
        ],
      ),
    );
  }
}
