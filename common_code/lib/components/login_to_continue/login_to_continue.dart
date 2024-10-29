import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';

class LoginToContinue extends StatelessWidget {
  const LoginToContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        children: [
          Text(
            "Sorry!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CommonColors.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "You are not logged in yet",
            style: TextStyle(fontSize: 10, color: CommonColors.secondaryTant),
          ),
          const SizedBox(height: 20),
          const InteractiveButton(label: "Login to continue")
        ],
      ),
    );
  }
}
