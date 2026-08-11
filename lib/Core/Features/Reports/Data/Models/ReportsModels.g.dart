// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReportsModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
  from: json['from'] as String?,
  to: json['to'] as String?,
  workingDays: (json['workingDays'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  days: (json['days'] as List<dynamic>?)
      ?.map((e) => Days.fromJson(e as Map<String, dynamic>))
      .toList(),
  summary: json['summary'] == null
      ? null
      : Summary.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'workingDays': instance.workingDays,
      'days': instance.days,
      'summary': instance.summary,
    };

const _$HistoryModelJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'from': {'type': 'string'},
    'to': {'type': 'string'},
    'workingDays': {
      'type': 'array',
      'items': {'type': 'integer'},
    },
    'days': {
      'type': 'array',
      'items': {r'$ref': r'#/$defs/Days'},
    },
    'summary': {r'$ref': r'#/$defs/Summary'},
  },
  r'$defs': {
    'Days': {
      'type': 'object',
      'properties': {
        'date': {'type': 'string'},
        'status': {'type': 'string'},
        'weekday': {'type': 'integer'},
        'isWorkingDay': {'type': 'boolean'},
        'checkInAt': {'type': 'string'},
        'checkOutAt': {'type': 'string'},
        'checkInDistanceMeters': {'type': 'integer'},
        'checkOutDistanceMeters': {'type': 'integer'},
        'workedMinutes': {'type': 'integer'},
        'workplaceId': {'type': 'string'},
        'workplaceName': {'type': 'string'},
      },
    },
    'Summary': {
      'type': 'object',
      'properties': {
        'present': {'type': 'integer'},
        'incomplete': {'type': 'integer'},
        'absent': {'type': 'integer'},
        'weekend': {'type': 'integer'},
        'upcoming': {'type': 'integer'},
      },
    },
  },
};

Days _$DaysFromJson(Map<String, dynamic> json) => Days(
  date: json['date'] as String?,
  status: json['status'] as String?,
  weekday: (json['weekday'] as num?)?.toInt(),
  isWorkingDay: json['isWorkingDay'] as bool?,
  checkInAt: json['checkInAt'] as String?,
  checkOutAt: json['checkOutAt'] as String?,
  checkInDistanceMeters: (json['checkInDistanceMeters'] as num?)?.toInt(),
  checkOutDistanceMeters: (json['checkOutDistanceMeters'] as num?)?.toInt(),
  workedMinutes: (json['workedMinutes'] as num?)?.toInt(),
  workplaceId: json['workplaceId'] as String?,
  workplaceName: json['workplaceName'] as String?,
);

Map<String, dynamic> _$DaysToJson(Days instance) => <String, dynamic>{
  'date': instance.date,
  'status': instance.status,
  'weekday': instance.weekday,
  'isWorkingDay': instance.isWorkingDay,
  'checkInAt': instance.checkInAt,
  'checkOutAt': instance.checkOutAt,
  'checkInDistanceMeters': instance.checkInDistanceMeters,
  'checkOutDistanceMeters': instance.checkOutDistanceMeters,
  'workedMinutes': instance.workedMinutes,
  'workplaceId': instance.workplaceId,
  'workplaceName': instance.workplaceName,
};

const _$DaysJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'date': {'type': 'string'},
    'status': {'type': 'string'},
    'weekday': {'type': 'integer'},
    'isWorkingDay': {'type': 'boolean'},
    'checkInAt': {'type': 'string'},
    'checkOutAt': {'type': 'string'},
    'checkInDistanceMeters': {'type': 'integer'},
    'checkOutDistanceMeters': {'type': 'integer'},
    'workedMinutes': {'type': 'integer'},
    'workplaceId': {'type': 'string'},
    'workplaceName': {'type': 'string'},
  },
};

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
  present: (json['present'] as num?)?.toInt(),
  incomplete: (json['incomplete'] as num?)?.toInt(),
  absent: (json['absent'] as num?)?.toInt(),
  weekend: (json['weekend'] as num?)?.toInt(),
  upcoming: (json['upcoming'] as num?)?.toInt(),
);

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
  'present': instance.present,
  'incomplete': instance.incomplete,
  'absent': instance.absent,
  'weekend': instance.weekend,
  'upcoming': instance.upcoming,
};

const _$SummaryJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'present': {'type': 'integer'},
    'incomplete': {'type': 'integer'},
    'absent': {'type': 'integer'},
    'weekend': {'type': 'integer'},
    'upcoming': {'type': 'integer'},
  },
};
