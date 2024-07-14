import 'package:common_code/resources/common_colors.dart';
import 'package:common_code/util/global_context.dart';
import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  const DialogContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.transparent, child: child);
  }
}

class Tmp {
  static void defaultAction = () {};
}

// ignore: non_constant_identifier_names
Future<void> showAlertDialog({
  required BuildContext context,
  Widget title = const SizedBox(),
  Widget content = const SizedBox(),
  List<Widget> actionWidgets = const [],
  Map<String, Function(BuildContext context)?> actions = const {},
  bool dismissible = false,
  Function? onDismissed,
  double insetPadding = 20,
}) {
  if (actions.isEmpty && actionWidgets.isEmpty) actions['OK'] = null;

  var actions0 = {...actions};
  var res = <Widget>[];

  dynamic popFn = ((context) {
    // Navigator.of(context, rootNavigator: true).pop();
    GlobalContext().router.pop();

    onDismissed?.call();
  });
  actions0.forEach((key, value) {
    res.add(
      TextButton(
        onPressed: () => (value ?? popFn)!(context),
        style: TextButton.styleFrom(
          foregroundColor:
              key == 'Cancel' ? CommonColors.secondary : CommonColors.primary,
        ),
        child: Text(key),
      ),
    );
  });

  res = [...res, ...actionWidgets];

  return showGeneralDialog<void>(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox();
    },
    barrierDismissible: dismissible,

    // barrierColor: Colors.black.withOpacity(0.4),
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(.6),
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, a1, anim2, child) {
      return ScaleTransition(
        // scale: anim1.value,
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
        child: Opacity(
          opacity: a1.value,
          // padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            title: title,
            content: SizedBox(
              // color: const Color.fromARGB(255, 63, 23, 224),
              width: MediaQuery.of(context).size.width,
              child: content,
            ),
            actions: res,
            alignment: Alignment.center,
            contentPadding: const EdgeInsets.all(0),
            insetPadding: EdgeInsets.all(insetPadding),
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            shadowColor: Colors.green,
            iconColor: Colors.green,
            iconPadding: EdgeInsets.zero,
            // icon: const Icon(Icons.check_circle),
            actionsPadding: const EdgeInsets.all(0),
            actionsAlignment: MainAxisAlignment.end,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      );
    },
  );
}
