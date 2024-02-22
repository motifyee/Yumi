import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  DialogContainer({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(child: child);
  }
}
