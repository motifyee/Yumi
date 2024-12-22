// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewStateImpl _$$ReviewStateImplFromJson(Map<String, dynamic> json) =>
    _$ReviewStateImpl(
      pagination: PaginatedData<Review>.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$ReviewStateImplToJson(_$ReviewStateImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };
