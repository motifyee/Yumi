import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'profile',
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
      ),
    ));
  }
}
