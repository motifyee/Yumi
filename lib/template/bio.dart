import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultBlockGap),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/bio.svg'),
              SizedBox(width: ThemeSelector.statics.defaultLineGap),
              Text(
                S.of(context).bio,
                style: TextStyle(
                  color: ThemeSelector.colors.secondary,
                  fontSize: ThemeSelector.fonts.font_14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(child: Text('')),
              SvgPicture.asset('assets/images/pin.svg'),
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          Container(
            constraints: BoxConstraints(
                minHeight: ThemeSelector.statics.defaultGapExtreme),
            child: Center(
              child: Text(
                S.of(context).writeABio,
                style: TextStyle(
                  color: ThemeSelector.colors.secondary,
                  fontSize: ThemeSelector.fonts.font_10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
