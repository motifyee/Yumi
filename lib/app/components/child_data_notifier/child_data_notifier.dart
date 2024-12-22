import 'package:flutter/widgets.dart';

class ChildDataNotifier extends StatelessWidget {
  final Widget Function(BuildContext context, WidgetData data, Widget? child)
      builder;
  final Widget? child;

  const ChildDataNotifier({
    super.key,
    required this.builder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<WidgetData> notifier =
        ValueNotifier(const WidgetData(Size(0, 0), Offset(0, 0)));

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final RenderBox renderBox = context.findRenderObject()! as RenderBox;
        final size = renderBox.size;
        final pos = renderBox.localToGlobal(Offset.zero);

        notifier.value = WidgetData(size, pos);
      },
    );
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: builder,
      child: child,
    );
  }
}

class WidgetData {
  final Size size;
  final Offset offset;

  const WidgetData(this.size, this.offset);
}
