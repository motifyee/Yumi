import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/menu.dart';

@RoutePage()
class MenuPreOrderScreen extends StatelessWidget {
  const MenuPreOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          SizedBox(
            width: ThemeSelector.statics.defaultTitleGap,
          )
        ],
        title: Center(
          child: Text(
            S.of(context).menuPreOrders,
            style: TextStyle(
              color: ThemeSelector.colors.primary,
              fontSize: ThemeSelector.fonts.font_14,
            ),
          ),
        ),
      ),
      body: MenuTemplate(
        menuTarget: MenuTarget.preOrder,
      ),
    );
  }
}
