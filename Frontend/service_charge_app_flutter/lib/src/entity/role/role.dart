// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

// part 'role.g.dart';

@JsonSerializable()
class Role {
  final int roleID;
  final String role;

  Role([
    this.roleID = 0,
    this.role = "",
  ]);

  // factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  // Map<String, dynamic> toJson() => _$RoleToJson(this);

  Map<String, dynamic> toJon() {
    return <String, dynamic>{
      'roleID': roleID,
      'role': role,
    };
  }

  factory Role.fromjson(Map<String, dynamic> map) {
    return Role(
      map['roleID'] as int,
      map['role'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Role.fromJson(String source) => Role.fromMap(json.decode(source) as Map<String, dynamic>);
}
