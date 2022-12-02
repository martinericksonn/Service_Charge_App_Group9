// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['userID'] as int? ?? 0,
      json['firstName'] as String? ?? "",
      json['lastName'] as String? ?? "",
      json['password'] as String? ?? "",
      json['email'] as String? ?? "",
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'email': instance.email,
    };
