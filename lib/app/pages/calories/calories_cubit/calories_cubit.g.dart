// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calories_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaloriesStateImpl _$$CaloriesStateImplFromJson(Map<String, dynamic> json) =>
    _$CaloriesStateImpl(
      paginationHelper: PaginationHelper<Calories>.fromJson(
          json['paginationHelper'] as Map<String, dynamic>),
      status: $enumDecode(_$ObseleteStatusEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$$CaloriesStateImplToJson(_$CaloriesStateImpl instance) =>
    <String, dynamic>{
      'paginationHelper': instance.paginationHelper,
      'status': _$ObseleteStatusEnumEnumMap[instance.status]!,
    };

const _$ObseleteStatusEnumEnumMap = {
  ObseleteStatusEnum.init: 'init',
  ObseleteStatusEnum.initSuccess: 'initSuccess',
  ObseleteStatusEnum.initError: 'initError',
  ObseleteStatusEnum.loading: 'loading',
  ObseleteStatusEnum.success: 'success',
  ObseleteStatusEnum.error: 'error',
  ObseleteStatusEnum.idle: 'idle',
  ObseleteStatusEnum.formSaved: 'formSaved',
  ObseleteStatusEnum.formReset: 'formReset',
  ObseleteStatusEnum.selected: 'selected',
};
