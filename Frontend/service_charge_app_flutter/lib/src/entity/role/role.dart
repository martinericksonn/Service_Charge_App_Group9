// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Role {
  final int roleID;
  final String role;

  Role([
    this.roleID = 0,
    this.role = "",
  ]);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'roleID': roleID,
      'role': role,
    };
  }

  factory Role.fromJson(Map<String, dynamic> map) {
    return Role(
      map['roleID'] as int,
      map['role'] as String,
    );
  }
}
