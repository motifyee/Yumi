import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class PreOrder extends StatelessWidget {
  const PreOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'pre order',
      style: TextStyle(
        color: ThemeSelector.colors.primary,
        fontSize: ThemeSelector.fonts.font_14,
      ),
    ));
  }
}
