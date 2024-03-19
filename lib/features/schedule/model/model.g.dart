// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDataImpl _$$ScheduleDataImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDataImpl(
      id: json['id'] as String? ?? '',
      userID: json['userID'] as String? ?? '',
      saturdayActive: json['saturday_Active'] as bool?,
      saturdayStart: const TimeOfDayConverter()
          .fromJson(json['saturday_Start'] as String?),
      saturdayEnd:
          const TimeOfDayConverter().fromJson(json['saturday_End'] as String?),
      sundayActive: json['sunday_Active'] as bool?,
      sundayStart:
          const TimeOfDayConverter().fromJson(json['sunday_Start'] as String?),
      sundayEnd:
          const TimeOfDayConverter().fromJson(json['sunday_End'] as String?),
      mondayActive: json['monday_Active'] as bool?,
      mondayStart:
          const TimeOfDayConverter().fromJson(json['monday_Start'] as String?),
      mondayEnd:
          const TimeOfDayConverter().fromJson(json['monday_End'] as String?),
      tuesdayActive: json['tuesday_Active'] as bool?,
      tuesdayStart:
          const TimeOfDayConverter().fromJson(json['tuesday_Start'] as String?),
      tuesdayEnd:
          const TimeOfDayConverter().fromJson(json['tuesday_End'] as String?),
      wednesdayActive: json['wednesday_Active'] as bool?,
      wednesdayStart: const TimeOfDayConverter()
          .fromJson(json['wednesday_Start'] as String?),
      wednesdayEnd:
          const TimeOfDayConverter().fromJson(json['wednesday_End'] as String?),
      thursdayActive: json['thursday_Active'] as bool?,
      thursdayStart: const TimeOfDayConverter()
          .fromJson(json['thursday_Start'] as String?),
      thursdayEnd:
          const TimeOfDayConverter().fromJson(json['thursday_End'] as String?),
      fridayActive: json['friday_Active'] as bool?,
      fridayStart:
          const TimeOfDayConverter().fromJson(json['friday_Start'] as String?),
      fridayEnd:
          const TimeOfDayConverter().fromJson(json['friday_End'] as String?),
    );

Map<String, dynamic> _$$ScheduleDataImplToJson(_$ScheduleDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'saturday_Active': instance.saturdayActive,
      'saturday_Start':
          const TimeOfDayConverter().toJson(instance.saturdayStart),
      'saturday_End': const TimeOfDayConverter().toJson(instance.saturdayEnd),
      'sunday_Active': instance.sundayActive,
      'sunday_Start': const TimeOfDayConverter().toJson(instance.sundayStart),
      'sunday_End': const TimeOfDayConverter().toJson(instance.sundayEnd),
      'monday_Active': instance.mondayActive,
      'monday_Start': const TimeOfDayConverter().toJson(instance.mondayStart),
      'monday_End': const TimeOfDayConverter().toJson(instance.mondayEnd),
      'tuesday_Active': instance.tuesdayActive,
      'tuesday_Start': const TimeOfDayConverter().toJson(instance.tuesdayStart),
      'tuesday_End': const TimeOfDayConverter().toJson(instance.tuesdayEnd),
      'wednesday_Active': instance.wednesdayActive,
      'wednesday_Start':
          const TimeOfDayConverter().toJson(instance.wednesdayStart),
      'wednesday_End': const TimeOfDayConverter().toJson(instance.wednesdayEnd),
      'thursday_Active': instance.thursdayActive,
      'thursday_Start':
          const TimeOfDayConverter().toJson(instance.thursdayStart),
      'thursday_End': const TimeOfDayConverter().toJson(instance.thursdayEnd),
      'friday_Active': instance.fridayActive,
      'friday_Start': const TimeOfDayConverter().toJson(instance.fridayStart),
      'friday_End': const TimeOfDayConverter().toJson(instance.fridayEnd),
    };
