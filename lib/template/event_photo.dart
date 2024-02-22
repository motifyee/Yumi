import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/upload_photo_button.dart';

class EventsPhoto extends StatelessWidget {
  const EventsPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultTitleGap),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/camera_dark.svg'),
              SizedBox(width: ThemeSelector.statics.defaultLineGap),
              Text(
                S.of(context).eventsPhoto,
                style: TextStyle(
                  color: ThemeSelector.colors.secondary,
                  fontSize: ThemeSelector.fonts.font_14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          Container(
            constraints: BoxConstraints(
                minHeight: ThemeSelector.statics.defaultGapExtreme),
            child: Center(
              child: UploadPhotoButton(
                onPressed: (image) {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
