import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/news_orders.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: ThemeSelector.statics.defaultGap),
            TextButton(
              onPressed: () {
                setState(() {
                  _controller.jumpToPage(0);
                });
              },
              child: Text(
                S.of(context).myOrders,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeSelector.colors.primary
                        .withAlpha(_controller.page == 0 ? 255 : 150)),
              ),
            ),
            SizedBox(width: ThemeSelector.statics.defaultGap),
            TextButton(
              onPressed: () {
                setState(() {
                  _controller.jumpToPage(1);
                });
              },
              child: Text(
                S.of(context).myPreOrder,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeSelector.colors.primary
                        .withAlpha(_controller.page == 1 ? 255 : 150)),
              ),
            ),
          ],
        ),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              NewsOrders(data: [0, 1, 2, 3, 4, 5]),
              NewsOrders(data: [0]),
            ],
          ),
        ),
      ],
    );
  }
}
