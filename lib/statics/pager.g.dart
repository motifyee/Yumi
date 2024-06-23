// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagerImpl<T> _$$PagerImplFromJson<T>(Map<String, dynamic> json) =>
    _$PagerImpl<T>(
      pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 0,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$$PagerImplToJson<T>(_$PagerImpl<T> instance) =>
    <String, dynamic>{
      'pageNumber': _pageNumberToJson(instance.pageNumber),
      'pageSize': instance.pageSize,
    };
