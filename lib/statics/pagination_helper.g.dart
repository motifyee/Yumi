// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_helper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationHelperImpl<T> _$$PaginationHelperImplFromJson<T>(
        Map<String, dynamic> json) =>
    _$PaginationHelperImpl<T>(
      pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 0,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PaginationHelperImplToJson<T>(
        _$PaginationHelperImpl<T> instance) =>
    <String, dynamic>{
      'pageNumber': _pageNumberToJson(instance.pageNumber),
      'pageSize': instance.pageSize,
      'total': instance.total,
    };