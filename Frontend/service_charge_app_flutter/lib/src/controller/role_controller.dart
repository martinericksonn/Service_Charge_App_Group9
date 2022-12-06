import 'package:dio/dio.dart';
import 'package:service_charge_app/src/entity/role/Role.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';

class RoleController {
  final url = ('http://127.0.0.1:8080');
  final dio = Dio();

  Future<List<Role>> getRolesAll() async {
    List<Role> roleList = [];

    var response = await dio.get("$url/role/all");
    response.data["data"]
        .map((data) => {
              roleList.add(Role.fromJson(data)),
            })
        .toList();

    return roleList;
  }

  Future<Role> getRoleById(int id) async {
    Role role = Role();
    var response = await dio.get("$url/role/$id");
    response.data['data']
        .map((data) => {
              role = Role.fromJson(data),
            })
        .toList();
    return role;
  }

  Future<List<UserRole>> getUserRolesAll() async {
    List<UserRole> userRoleList = [];

    var response = await dio.get("$url/user-role/all");
    response.data["data"]
        .map((data) => {
              userRoleList.add(UserRole.fromJson(data)),
            })
        .toList();

    return userRoleList;
  }

  Future<UserRole> getUserRoleById(int id) async {
    UserRole userRole = UserRole();
    var response = await dio.get("$url/user-role/$id");
    response.data['data']
        .map((data) => {
              userRole = UserRole.fromJson(data),
            })
        .toList();
    return userRole;
  }
}
