// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDataImpl _$$ScheduleDataImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDataImpl(
      guid: json['guid'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      saturdayActive: json['saturdayActive'] as bool?,
      saturdayStart:
          const TimeOfDayConverter().fromJson(json['saturdayStart'] as String?),
      saturdayEnd:
          const TimeOfDayConverter().fromJson(json['saturdayEnd'] as String?),
      sundayActive: json['sundayActive'] as bool?,
      sundayStart:
          const TimeOfDayConverter().fromJson(json['sundayStart'] as String?),
      sundayEnd:
          const TimeOfDayConverter().fromJson(json['sundayEnd'] as String?),
      mondayActive: json['mondayActive'] as bool?,
      mondayStart:
          const TimeOfDayConverter().fromJson(json['mondayStart'] as String?),
      mondayEnd:
          const TimeOfDayConverter().fromJson(json['mondayEnd'] as String?),
      tuesdayActive: json['tuesdayActive'] as bool?,
      tuesdayStart:
          const TimeOfDayConverter().fromJson(json['tuesdayStart'] as String?),
      tuesdayEnd:
          const TimeOfDayConverter().fromJson(json['tuesdayEnd'] as String?),
      wednesdayActive: json['wednesdayActive'] as bool?,
      wednesdayStart: const TimeOfDayConverter()
          .fromJson(json['wednesdayStart'] as String?),
      wednesdayEnd:
          const TimeOfDayConverter().fromJson(json['wednesdayEnd'] as String?),
      thursdayActive: json['thursdayActive'] as bool?,
      thursdayStart:
          const TimeOfDayConverter().fromJson(json['thursdayStart'] as String?),
      thursdayEnd:
          const TimeOfDayConverter().fromJson(json['thursdayEnd'] as String?),
      fridayActive: json['fridayActive'] as bool?,
      fridayStart:
          const TimeOfDayConverter().fromJson(json['fridayStart'] as String?),
      fridayEnd:
          const TimeOfDayConverter().fromJson(json['fridayEnd'] as String?),
    );

Map<String, dynamic> _$$ScheduleDataImplToJson(_$ScheduleDataImpl instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'userId': instance.userId,
      'saturdayActive': instance.saturdayActive,
      'saturdayStart':
          const TimeOfDayConverter().toJson(instance.saturdayStart),
      'saturdayEnd': const TimeOfDayConverter().toJson(instance.saturdayEnd),
      'sundayActive': instance.sundayActive,
      'sundayStart': const TimeOfDayConverter().toJson(instance.sundayStart),
      'sundayEnd': const TimeOfDayConverter().toJson(instance.sundayEnd),
      'mondayActive': instance.mondayActive,
      'mondayStart': const TimeOfDayConverter().toJson(instance.mondayStart),
      'mondayEnd': const TimeOfDayConverter().toJson(instance.mondayEnd),
      'tuesdayActive': instance.tuesdayActive,
      'tuesdayStart': const TimeOfDayConverter().toJson(instance.tuesdayStart),
      'tuesdayEnd': const TimeOfDayConverter().toJson(instance.tuesdayEnd),
      'wednesdayActive': instance.wednesdayActive,
      'wednesdayStart':
          const TimeOfDayConverter().toJson(instance.wednesdayStart),
      'wednesdayEnd': const TimeOfDayConverter().toJson(instance.wednesdayEnd),
      'thursdayActive': instance.thursdayActive,
      'thursdayStart':
          const TimeOfDayConverter().toJson(instance.thursdayStart),
      'thursdayEnd': const TimeOfDayConverter().toJson(instance.thursdayEnd),
      'fridayActive': instance.fridayActive,
      'fridayStart': const TimeOfDayConverter().toJson(instance.fridayStart),
      'fridayEnd': const TimeOfDayConverter().toJson(instance.fridayEnd),
    };
