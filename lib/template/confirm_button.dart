import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton(
      {super.key, this.onPressed, required this.label, this.enabled = true});

  final bool enabled;
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {if (onPressed != null) onPressed!()},
      splashColor: ThemeSelector.colors.secondary,
      borderRadius:
          BorderRadius.circular(ThemeSelector.statics.buttonBorderRadius),
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: EdgeInsets.symmetric(
            vertical: ThemeSelector.statics.buttonPaddingV),
        width: ThemeSelector.statics.buttonWidth,
        decoration: BoxDecoration(
          color: enabled
              ? ThemeSelector.colors.primary.withOpacity(.95)
              : ThemeSelector.colors.secondary.withOpacity(.95),
          borderRadius:
              BorderRadius.circular(ThemeSelector.statics.buttonBorderRadius),
        ),
        child: Center(
          child: Text(label, style: Theme.of(context).textTheme.displayLarge
              // ?.copyWith(color: Colors.red),
              ),
        ),
      ),
    );
  }
}
