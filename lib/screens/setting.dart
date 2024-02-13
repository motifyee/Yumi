import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'setting',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ),
      ),
    );
  }
}
