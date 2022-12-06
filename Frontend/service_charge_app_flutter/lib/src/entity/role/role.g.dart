// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      json['roleID'] as int? ?? 0,
      json['role'] as String? ?? "",
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'roleID': instance.roleID,
      'role': instance.role,
    };
