import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'menu',
      style: TextStyle(
        color: ThemeSelector.colors.primary,
        fontSize: ThemeSelector.fonts.font_14,
      ),
    ));
  }
}
