import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final int userID;
  final String firstName;
  final String lastName;
  final String password;
  final String email;

  User({
    this.userID = 0,
    this.firstName = "",
    this.lastName = "",
    this.password = "",
    this.email = "",
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
