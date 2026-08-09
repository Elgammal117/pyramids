import 'package:json_annotation/json_annotation.dart';

part 'AuthModels.g.dart';

@JsonSerializable(createJsonSchema: true)
class LoginModel {
  String? accessToken;
  UserModel? user;

  LoginModel({this.accessToken, this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  static const jsonSchema = _$LoginModelJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class SignUpModel {
  UserModel? user;

  SignUpModel({this.user});

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  static const jsonSchema = _$SignUpModelJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class UserModel {
  String? id;
  String? name;
  String? email;
  String? createdAt;

  UserModel({this.id, this.name, this.email, this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static const jsonSchema = _$UserModelJsonSchema;
}
