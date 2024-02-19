import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

@RoutePage()
class MenuPreOrderScreen extends StatelessWidget {
  const MenuPreOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      S.of(context).menuPreOrders,
      style: TextStyle(
        color: ThemeSelector.colors.primary,
        fontSize: ThemeSelector.fonts.font_14,
      ),
    ));
  }
}
