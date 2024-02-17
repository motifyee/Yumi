import 'package:flutter/material.dart';

class SnackBarMassage extends StatelessWidget {
  const SnackBarMassage({super.key, required this.massage});

  final String massage;

  @override
  Widget build(BuildContext context) {
    return Text(massage);
  }
}
