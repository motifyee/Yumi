import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class DialogContainer extends StatelessWidget {
  DialogContainer({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
      decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          borderRadius:
              BorderRadius.circular(ThemeSelector.statics.defaultGap)),
      child: child,
    ));
  }
}
