// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRole _$UserRoleFromJson(Map<String, dynamic> json) => UserRole(
      json['userRoleID'] as int? ?? 0,
      json['roleID'] as int? ?? 0,
      json['userID'] as int? ?? 0,
    );

Map<String, dynamic> _$UserRoleToJson(UserRole instance) => <String, dynamic>{
      'userRoleID': instance.userRoleID,
      'roleID': instance.roleID,
      'userID': instance.userID,
    };
