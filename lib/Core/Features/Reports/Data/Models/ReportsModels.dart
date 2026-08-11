import 'package:json_annotation/json_annotation.dart';

part 'ReportsModels.g.dart';

@JsonSerializable(createJsonSchema: true)
class HistoryModel {
  String? from;
  String? to;
  List<int>? workingDays;
  List<Days>? days;
  Summary? summary;

  HistoryModel({this.from, this.to, this.workingDays, this.days, this.summary});

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);

  static const jsonSchema = _$HistoryModelJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class Days {
  String? date;
  String? status;
  int? weekday;
  bool? isWorkingDay;
  String? checkInAt;
  String? checkOutAt;
  int? checkInDistanceMeters;
  int? checkOutDistanceMeters;
  int? workedMinutes;
  String? workplaceId;
  String? workplaceName;

  Days({
    this.date,
    this.status,
    this.weekday,
    this.isWorkingDay,
    this.checkInAt,
    this.checkOutAt,
    this.checkInDistanceMeters,
    this.checkOutDistanceMeters,
    this.workedMinutes,
    this.workplaceId,
    this.workplaceName,
  });

  factory Days.fromJson(Map<String, dynamic> json) => _$DaysFromJson(json);

  Map<String, dynamic> toJson() => _$DaysToJson(this);

  static const jsonSchema = _$DaysJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class Summary {
  int? present;
  int? incomplete;
  int? absent;
  int? weekend;
  int? upcoming;

  Summary({
    this.present,
    this.incomplete,
    this.absent,
    this.weekend,
    this.upcoming,
  });

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);

  static const jsonSchema = _$SummaryJsonSchema;
}
