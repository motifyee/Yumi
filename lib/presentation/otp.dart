import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List<GlobalKey> keys = [0, 1, 2, 3].map((e) => GlobalKey()).toList();

class OTP extends StatelessWidget {
  final void Function(String input, String otp, int idx)? onInput;
  final void Function(Object?)? onSaved;
  final void Function(String)? onLastFilled;
  final String? initialOTP;

  OTP({
    super.key,
    this.onInput,
    this.onSaved,
    this.onLastFilled,
    this.initialOTP,
  });

  final List<FocusNode> fieldNodes =
      [0, 1, 2, 3].map((e) => FocusNode()).toList();
  final List<TextEditingController> controllers =
      [0, 1, 2, 3].map((e) => TextEditingController()).toList();

  int get focused => fieldNodes.indexWhere((element) => element.hasFocus);

  @override
  Widget build(BuildContext context) {
    final init = initialOTP?.padRight(4, '0');
    List<String> otp = init?.split('') ?? List.filled(4, "");

    return FormField(
        onSaved: onSaved,
        builder: (state) {
          return Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _input(0, otp, context),
                _input(1, otp, context),
                _input(2, otp, context),
                _input(3, otp, context),
              ],
            ),
          );
        });
  }

  SizedBox _input(int idx, List<String> otp, BuildContext context) {
    var fieldNode = fieldNodes[idx];
    var ctrl = controllers[idx];
    ctrl.text = otp[idx].length == 1 ? otp[idx] : '';

    return SizedBox(
      height: 68,
      width: 34,
      child: Focus(
        skipTraversal: true,
        onKeyEvent: (node, value) {
          // print('${value.logicalKey.keyLabel} == ${value.character} @$idx\n');
          if (!fieldNode.hasFocus) return KeyEventResult.ignored;
          if (value is! KeyDownEvent) return KeyEventResult.ignored;

          if (ctrl.text.isEmpty && value.logicalKey.keyLabel == 'Backspace') {
            var i = idx > 0 ? idx - 1 : idx;
            fieldNodes[i].requestFocus();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: TextFormField(
          key: keys[idx],
          focusNode: fieldNode,
          controller: ctrl,
          decoration: const InputDecoration(),
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
          maxLength: 1,
          autofocus: true,
          autocorrect: false,
          enableSuggestions: false,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {
            if (value.isEmpty && value == otp[idx]) return;
            otp[idx] = value;
            // FocusScope.of(context).nextFocus();
            var i = idx < 3 ? idx + 1 : idx;
            if (value.isNotEmpty && i != idx) {
              fieldNodes[i].requestFocus();
              controllers[i].value = controllers[i].value.copyWith(
                  selection: TextSelection(
                      baseOffset: 0, extentOffset: controllers[i].text.length));
            }

            if (onLastFilled != null &&
                i == idx &&
                value.isNotEmpty &&
                otp.every((e) => e.isNotEmpty)) {
              onLastFilled!(otp.join());
            }

            if (onInput != null) {
              onInput!(otp.where((e) => e.isNotEmpty).join(), value, idx);
            }
          },
          onTap: () {
            ctrl.value = ctrl.value.copyWith(
                selection: TextSelection(
              baseOffset: 0,
              extentOffset: ctrl.text.length,
            ));
          },
        ),
      ),
    );
  }
}
