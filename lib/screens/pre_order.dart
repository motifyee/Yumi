import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class PreOrderScreen extends StatelessWidget {
  const PreOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'pre order',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: ThemeSelector.fonts.font_14,
          ),
    ));
  }
}
