import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class EventsPhoto extends StatelessWidget {
  const EventsPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultBlockGap),
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
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
                    width: ThemeSelector.statics.iconSizeExtreme,
                    height: ThemeSelector.statics.iconSizeExtreme,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.iconSizeLarge),
                        border: Border.fromBorderSide(BorderSide(
                          width: ThemeSelector.statics.defaultGap,
                          color: ThemeSelector.colors.primary,
                        ))),
                    child: SvgPicture.asset('assets/images/camera.svg'),
                  ),
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
            ),
          )
        ],
      ),
    );
  }
}
