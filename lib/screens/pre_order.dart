import 'package:flutter/material.dart';

class PreOrder extends StatelessWidget {
  const PreOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'pre order',
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
      ),
    ));
  }
}
