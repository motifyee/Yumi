import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'menu',
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
      ),
    ));
  }
}
