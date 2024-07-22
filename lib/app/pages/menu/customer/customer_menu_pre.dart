import 'package:flutter/material.dart';
import 'package:yumi/app/pages/menu/widgets/customer_news.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';

class CustomerMenuPreScreen extends StatelessWidget {
  const CustomerMenuPreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomerNews(
      menuTarget: MenuTarget.preOrder,
    );
  }
}
