// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
  accessToken: json['accessToken'] as String?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'user': instance.user,
    };

const _$LoginModelJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'accessToken': {'type': 'string'},
    'user': {r'$ref': r'#/$defs/UserModel'},
  },
  r'$defs': {
    'UserModel': {
      'type': 'object',
      'properties': {
        'id': {'type': 'string'},
        'name': {'type': 'string'},
        'email': {'type': 'string'},
        'createdAt': {'type': 'string'},
      },
    },
  },
};

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{'user': instance.user};

const _$SignUpModelJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'user': {r'$ref': r'#/$defs/UserModel'},
  },
  r'$defs': {
    'UserModel': {
      'type': 'object',
      'properties': {
        'id': {'type': 'string'},
        'name': {'type': 'string'},
        'email': {'type': 'string'},
        'createdAt': {'type': 'string'},
      },
    },
  },
};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'createdAt': instance.createdAt,
};

const _$UserModelJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'id': {'type': 'string'},
    'name': {'type': 'string'},
    'email': {'type': 'string'},
    'createdAt': {'type': 'string'},
  },
};
