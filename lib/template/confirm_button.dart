import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, this.onPressed, required this.label});

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {if (onPressed != null) onPressed!()},
      borderRadius:
          BorderRadius.circular(ThemeSelector.statics.buttonBorderRadius),
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: EdgeInsets.symmetric(
            vertical: ThemeSelector.statics.buttonPaddingV),
        width: ThemeSelector.statics.buttonWidth,
        decoration: BoxDecoration(
          color: ThemeSelector.colors.primary,
          borderRadius:
              BorderRadius.circular(ThemeSelector.statics.buttonBorderRadius),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
