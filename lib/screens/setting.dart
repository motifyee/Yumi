import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'setting',
        style: TextStyle(
          color: ThemeSelector.colors.primary,
          fontSize: ThemeSelector.fonts.font_14,
        ),
      ),
    );
  }
}
