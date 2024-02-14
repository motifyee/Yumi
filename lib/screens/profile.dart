import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'profile',
      style: TextStyle(
        color: ThemeSelector.colors.primary,
        fontSize: ThemeSelector.fonts.font_14,
      ),
    ));
  }
}
