import 'package:flutter/widgets.dart';

import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/global.dart';

class RegisterationPage<T> extends StatelessWidget {
  final RegStep step;
  final RegStep? nextStep;
  final Widget page;
  final void Function(T?)? onDone;
  final VoidCallback? onCancel;

  const RegisterationPage({
    super.key,
    required this.step,
    this.nextStep,
    required this.page,
    this.onDone,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return page;
  }

  Future<void> done([T? value]) async {
    if (nextStep != null) {
      await G().rd<RegCubit>().navigateToIdx(nextStep!.index);
    }

    if (onDone != null) onDone!(value);
  }

  void cancel() => onCancel != null ? onCancel!() : null;

  // to access the object from the child (Widget page)
  static RegisterationPage? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<RegisterationPage>();
}
