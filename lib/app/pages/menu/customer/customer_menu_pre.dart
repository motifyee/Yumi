import 'package:flutter/material.dart';
import 'package:yumi/app/pages/menu/meal.dart';
import 'package:yumi/app/pages/menu/widgets/customer_news.dart';

class CustomerMenuPreScreen extends StatelessWidget {
  const CustomerMenuPreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomerNews(
      menuTarget: MenuTarget.preOrder,
    );
  }
}
