import 'package:flutter/material.dart';
import 'package:yumi/app/pages/menu/widgets/customer_news.dart';
import 'package:yumi/domain/meal/entity/meal.dart';

class CustomerMenuScreen extends StatelessWidget {
  const CustomerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomerNews(
      menuTarget: MenuTarget.order,
    );
  }
}
