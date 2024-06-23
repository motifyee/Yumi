import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pager.dart';

abstract class CaloriesSource {
  Future<Pager<Calories>> loadCalories({required Pager<Calories> pager});
}
