import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';
import 'package:service_charge_app/src/entity/user/user.dart';

class UserController {
  final url = ('http://127.0.0.1:8080/user');
  final dio = Dio();
  late Ticket ticket;

  Future<List<User>> getUserAll() async {
    List<User> userList = [];

    var response = await dio.get("$url/all");
    response.data['data']
        .map((data) => {
              userList.add(User.fromJson(data)),
            })
        .toList();
    return userList;
  }

  Future<User> getUserId(int id) async {
    User user = User();

    var response = await dio.get("$url/$id");
    response.data['data']
        .map((data) => {
              user = User.fromJson(data),
            })
        .toList();
    return user;
  }

  Future<dynamic> saveUser(String endpoint, User user) async {
    var formData = FormData.fromMap(ticket.toJson());
    var response = await dio.post(
      "$url/$endpoint",
      data: formData,
    );

    return response;
  }

  Future<dynamic> deleteUser(int id) async {
    var response = await dio.delete(
      '$url/delete/$id',
    );

    return response;
  }

}
