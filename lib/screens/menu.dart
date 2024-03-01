import 'package:flutter/material.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/template/menu.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(
      menuTarget: MenuTarget.order,
    );
  }
}
