import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({super.key, required this.isSelected});

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ThemeSelector.statics.defaultGapExtreme,
      height: ThemeSelector.statics.defaultBlockGap,
      decoration: BoxDecoration(
        color: ThemeSelector.colors.backgroundTant,
        borderRadius: BorderRadius.circular(
            ThemeSelector.statics.defaultBorderRadiusSubLarge),
      ),
      child: AnimatedAlign(
        duration: ThemeSelector.statics.animationDuration,
        alignment: isSelected ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: ThemeSelector.statics.animationDuration,
          width: ThemeSelector.statics.defaultBlockGap,
          height: ThemeSelector.statics.defaultBlockGap,
          decoration: BoxDecoration(
            color: isSelected
                ? ThemeSelector.colors.primary
                : ThemeSelector.colors.secondaryFaint,
            borderRadius:
                BorderRadius.circular(ThemeSelector.statics.defaultBlockGap),
          ),
        ),
      ),
    );
  }
}
