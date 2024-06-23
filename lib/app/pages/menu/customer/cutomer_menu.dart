import 'package:flutter/material.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';
import 'package:yumi/app/pages/menu/widgets/customer_news.dart';

class CustomerMenuScreen extends StatelessWidget {
  const CustomerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomerNews(
      menuTarget: MenuTarget.order,
    );
  }
}
