// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealStateImpl _$$MealStateImplFromJson(Map<String, dynamic> json) =>
    _$MealStateImpl(
      pagination: PaginatedData<Meal>.fromJson(
          json['pagination'] as Map<String, dynamic>),
      selectedCategory: (json['selectedCategory'] as num).toInt(),
      menuTarget: $enumDecode(_$MenuTargetEnumMap, json['menuTarget']),
      mealsLength: (json['mealsLength'] as num?)?.toInt() ?? 0,
      changesCounter: (json['changesCounter'] as num?)?.toInt() ?? 0,
      status:
          $enumDecodeNullable(_$StatusEnumMap, json['status']) ?? Status.init,
    );

Map<String, dynamic> _$$MealStateImplToJson(_$MealStateImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'selectedCategory': instance.selectedCategory,
      'menuTarget': _$MenuTargetEnumMap[instance.menuTarget]!,
      'mealsLength': instance.mealsLength,
      'changesCounter': instance.changesCounter,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$MenuTargetEnumMap = {
  MenuTarget.order: 'order',
  MenuTarget.preOrder: 'preOrder',
};

const _$StatusEnumMap = {
  Status.init: 'init',
  Status.initSuccess: 'initSuccess',
  Status.initError: 'initError',
  Status.loading: 'loading',
  Status.success: 'success',
  Status.error: 'error',
  Status.idle: 'idle',
  Status.formSaved: 'formSaved',
  Status.formReset: 'formReset',
  Status.selected: 'selected',
};
