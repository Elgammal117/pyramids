import 'package:json_annotation/json_annotation.dart';

part 'AttendanceModels.g.dart';

@JsonSerializable(createJsonSchema: true)
class CheckInOutModel {
  String? message;
  Attendance? attendance;

  CheckInOutModel({this.message, this.attendance});

  factory CheckInOutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInOutModelToJson(this);

  static const jsonSchema = _$CheckInOutModelJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class Attendance {
  String? date;
  String? workplaceId;
  String? workplaceName;
  String? checkInAt;
  int? checkInDistanceMeters;
  String? checkOutAt;
  int? workedHours;
  int? workedMinutes;
  int? totalWorkedMinutes;

  Attendance({
    this.date,
    this.workplaceId,
    this.workplaceName,
    this.checkInAt,
    this.checkInDistanceMeters,
    this.checkOutAt,
    this.workedHours,
    this.workedMinutes,
    this.totalWorkedMinutes,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  static const jsonSchema = _$AttendanceJsonSchema;
}
