import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/count_down_cubit/count_down_cubit.dart';

class OTP extends StatefulWidget {
  final void Function(String input, String otp, int idx)? onInput;
  final void Function(String?)? onSaved;
  final void Function(String)? onLastFilled;
  final String? initialOTP;

  const OTP({
    super.key,
    this.onInput,
    this.onSaved,
    this.onLastFilled,
    this.initialOTP,
  });

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final List<FocusNode> fieldNodes =
      [0, 1, 2, 3].map((e) => FocusNode()).toList();

  final List<TextEditingController> controllers =
      [0, 1, 2, 3].map((e) => TextEditingController()).toList();

  final List<GlobalKey> keys = [0, 1, 2, 3].map((e) => GlobalKey()).toList();

  int get focused => fieldNodes.indexWhere((element) => element.hasFocus);

  List<String> otp = [0, 1, 2, 3].map((e) => '').toList();

  @override
  void initState() {
    super.initState();

    final init = widget.initialOTP?.padRight(4, '');
    setState(() {
      otp = init?.split('') ?? List.filled(4, "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _input(0, otp, context),
        _input(1, otp, context),
        _input(2, otp, context),
        _input(3, otp, context),
      ],
    );
  }

  SizedBox _input(int idx, List<String> otp, BuildContext context) {
    var fieldNode = fieldNodes[idx];
    var ctrl = controllers[idx];
    ctrl.text = otp[idx].length == 1 ? otp[idx] : '';

    void selectField(int idx) {
      controllers[idx].value = controllers[idx].value.copyWith(
              selection: TextSelection(
            baseOffset: 0,
            extentOffset: controllers[idx].text.length,
          ));
    }

    return SizedBox(
      height: 68,
      width: 34,
      child: Focus(
        skipTraversal: true,
        onFocusChange: (isFocused) {
          if (isFocused) selectField(idx);
        },
        onKeyEvent: (node, value) {
          // print('${value.logicalKey.keyLabel} == ${value.character} @$idx\n');
          if (!fieldNode.hasFocus) return KeyEventResult.ignored;
          if (value is! KeyDownEvent) return KeyEventResult.ignored;

          if (ctrl.text.isEmpty && value.logicalKey.keyLabel == 'Backspace') {
            var i = idx > 0 ? idx - 1 : idx;
            fieldNodes[i].requestFocus();
            Future.delayed(const Duration(milliseconds: 100)).then(
              (_) => selectField(i),
            );
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
          // maxLength: 1,
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
            setState(() {
              otp[idx] = value;
              // context.read<CountDownCubit>().setValue(otp.join(''));
            });
            // FocusScope.of(context).nextFocus();
            var i = idx < 3 ? idx + 1 : idx;
            if (value.isNotEmpty && i != idx) {
              fieldNodes[i].requestFocus();
              controllers[i].value = controllers[i].value.copyWith(
                  selection: TextSelection(
                      baseOffset: 0, extentOffset: controllers[i].text.length));
            }

            if (widget.onLastFilled != null &&
                i == idx &&
                value.isNotEmpty &&
                otp.every((e) => e.isNotEmpty)) {
              widget.onLastFilled!(otp.join());
            }

            if (widget.onInput != null) {
              widget.onInput!(
                  otp.where((e) => e.isNotEmpty).join(), value, idx);
            }
          },
          onTap: () => selectField(idx),
        ),
      ),
    );
  }
}
