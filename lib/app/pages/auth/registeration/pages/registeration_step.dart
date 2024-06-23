// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/global.dart';

class RegisterationPage extends StatelessWidget {
  final RegStep step;
  final RegStep? nextStep;
  final Widget page;
  final VoidCallback? onNext;
  final VoidCallback? onCancel;

  const RegisterationPage({
    super.key,
    required this.step,
    this.nextStep,
    required this.page,
    this.onNext,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return page;
  }

  void next() {
    if (nextStep != null) G.rd<RegCubit>().navigateToIdx(nextStep!.index);

    if (onNext != null) onNext!();
  }

  // to access the object from the child (Widget page)
  static RegisterationPage? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<RegisterationPage>();
}

class RegstepTest extends RegisterationPage {
  const RegstepTest(
      {super.key,
      required super.step,
      required super.page,
      required super.onNext,
      required super.onCancel});
}
