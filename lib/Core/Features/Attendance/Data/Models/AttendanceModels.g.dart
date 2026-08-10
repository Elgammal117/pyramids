// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInOutModel _$CheckInOutModelFromJson(Map<String, dynamic> json) =>
    CheckInOutModel(
      message: json['message'] as String?,
      attendance: json['attendance'] == null
          ? null
          : Attendance.fromJson(json['attendance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckInOutModelToJson(CheckInOutModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'attendance': instance.attendance,
    };

const _$CheckInOutModelJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'message': {'type': 'string'},
    'attendance': {r'$ref': r'#/$defs/Attendance'},
  },
  r'$defs': {
    'Attendance': {
      'type': 'object',
      'properties': {
        'date': {'type': 'string'},
        'workplaceId': {'type': 'string'},
        'workplaceName': {'type': 'string'},
        'checkInAt': {'type': 'string'},
        'checkInDistanceMeters': {'type': 'integer'},
        'checkOutAt': {'type': 'string'},
        'workedHours': {'type': 'integer'},
        'workedMinutes': {'type': 'integer'},
        'totalWorkedMinutes': {'type': 'integer'},
      },
    },
  },
};

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
  date: json['date'] as String?,
  workplaceId: json['workplaceId'] as String?,
  workplaceName: json['workplaceName'] as String?,
  checkInAt: json['checkInAt'] as String?,
  checkInDistanceMeters: (json['checkInDistanceMeters'] as num?)?.toInt(),
  checkOutAt: json['checkOutAt'] as String?,
  workedHours: (json['workedHours'] as num?)?.toInt(),
  workedMinutes: (json['workedMinutes'] as num?)?.toInt(),
  totalWorkedMinutes: (json['totalWorkedMinutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'date': instance.date,
      'workplaceId': instance.workplaceId,
      'workplaceName': instance.workplaceName,
      'checkInAt': instance.checkInAt,
      'checkInDistanceMeters': instance.checkInDistanceMeters,
      'checkOutAt': instance.checkOutAt,
      'workedHours': instance.workedHours,
      'workedMinutes': instance.workedMinutes,
      'totalWorkedMinutes': instance.totalWorkedMinutes,
    };

const _$AttendanceJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'date': {'type': 'string'},
    'workplaceId': {'type': 'string'},
    'workplaceName': {'type': 'string'},
    'checkInAt': {'type': 'string'},
    'checkInDistanceMeters': {'type': 'integer'},
    'checkOutAt': {'type': 'string'},
    'workedHours': {'type': 'integer'},
    'workedMinutes': {'type': 'integer'},
    'totalWorkedMinutes': {'type': 'integer'},
  },
};
