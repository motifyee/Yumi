import 'package:flutter/widgets.dart';

class OnboardingStep {
  final String icon;
  final String stepTitle;
  final String stepDesc;
  final VoidCallback onTap;
  final bool Function() isActive;
  final bool Function() isDone;

  OnboardingStep({
    required this.icon,
    required this.stepTitle,
    required this.stepDesc,
    required this.onTap,
    required this.isActive,
    required this.isDone,
  });
}
