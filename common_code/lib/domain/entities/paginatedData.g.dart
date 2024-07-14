// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginatedData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationImpl<T> _$$PaginationImplFromJson<T>(Map<String, dynamic> json) =>
    _$PaginationImpl<T>(
      pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 0,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$$PaginationImplToJson<T>(_$PaginationImpl<T> instance) =>
    <String, dynamic>{
      'pageNumber': _pageNumberToJson(instance.pageNumber),
      'pageSize': instance.pageSize,
    };
