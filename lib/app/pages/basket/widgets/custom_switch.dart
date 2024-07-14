import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({super.key, required this.isSelected});

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CommonDimens.defaultGapExtreme,
      height: CommonDimens.defaultBlockGap,
      decoration: BoxDecoration(
        color: CommonColors.backgroundTant,
        borderRadius:
            BorderRadius.circular(CommonDimens.defaultBorderRadiusSubLarge),
      ),
      child: AnimatedAlign(
        duration: CommonDimens.animationDuration,
        alignment: isSelected ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: CommonDimens.animationDuration,
          width: CommonDimens.defaultBlockGap,
          height: CommonDimens.defaultBlockGap,
          decoration: BoxDecoration(
            color:
                isSelected ? CommonColors.primary : CommonColors.secondaryFaint,
            borderRadius: BorderRadius.circular(CommonDimens.defaultBlockGap),
          ),
        ),
      ),
    );
  }
}
