// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_list_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientListStateImpl _$$IngredientListStateImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientListStateImpl(
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      loading: json['loading'] as bool,
    );

Map<String, dynamic> _$$IngredientListStateImplToJson(
        _$IngredientListStateImpl instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients,
      'loading': instance.loading,
    };
