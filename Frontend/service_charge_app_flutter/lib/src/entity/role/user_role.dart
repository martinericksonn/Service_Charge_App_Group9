// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'user_role.g.dart';

@JsonSerializable()
class UserRole {
  final int userRoleID;
  final int roleID;
  final int userID;

  UserRole({
    this.userRoleID = 0,
    this.roleID = 0,
    this.userID = 0,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);
  Map<String, dynamic> toJson() => _$UserRoleToJson(this);
}
