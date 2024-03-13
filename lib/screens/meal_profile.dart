import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:yumi/model/meal_model.dart';

@RoutePage()
class MealProfileScreen extends StatelessWidget {
  MealProfileScreen({super.key, required this.meal});

  MealModel meal;

  @override
  Widget build(BuildContext context) {
    print(meal.toJson());
    return const Placeholder();
  }
}
