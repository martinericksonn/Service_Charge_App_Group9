import 'package:dio/dio.dart';
import 'package:service_charge_app/src/entity/role/Role.dart';

import '../entity/role/user_role.dart';

class RoleController {
  final url = ('http://127.0.0.1:8080');
  final role = "role";
  final userRole = "user-role";
  final dio = Dio();

  Future<List<Role>> getAllRole() async {
    List<Role> roleList = [];

    var response = await dio.get("$url/$role/all");
    response.data["data"]
        .map((data) => {
              roleList.add(Role.fromjson(data)),
            })
        .toList();

    return roleList;
  }

  Future<Role> getRoleById(int id) async {
    Role role = Role();
    var response = await dio.get("$url/$role/id");
    response.data['data']
        .map((data) => {
              role = Role.fromjson(data),
            })
        .toList();

    return role;
  }

  Future<List<UserRole>> getAllUserRole() async {
    List<UserRole> userRoleList = [];

    var response = await dio.get("$url/$userRole/all");
    response.data["data"]
        .map((data) => {
              userRoleList.add(UserRole.fromJson(data)),
            })
        .toList();

    return userRoleList;
  }

  Future<UserRole> getUserRoleById(int id) async {
    UserRole userRole = UserRole();
    var response = await dio.get("$url/$userRole/id");
    response.data['data']
        .map((data) => {
              userRole = UserRole.fromJson(data),
            })
        .toList();

    return userRole;
  }

  Future<int> getUserRoleByIdInt(int userID, int roleID) async {
    String userRoleID = "0";
    var response = await dio.get("$url/$userRole/$userID/$roleID");

    return response.data['data'];
  }

  Future<dynamic> deleteUserRole(int id) async {
    try {
      var response = await dio.delete(
        "$url/$userRole/delete/$id",
      );
      return response;
    } catch (e) {
      return e;
    }

    // ignore: dead_code
  }

  Future<dynamic> saveUserRole(String endpoint, UserRole thisUserRole) async {
    try {
      var formData = FormData.fromMap(thisUserRole.toJson());
      var response = await dio.post(
        "$url/$userRole/$endpoint",
        data: formData,
      );

      return response;
    } catch (e) {
      return e;
    }
  }
}
