import 'package:service_charge_app/src/entity/ticket.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:service_charge_app/src/entity/user.dart';

class UserController {
  final url = ('http://127.0.0.1:8080');
  final dio = Dio();
  late Ticket ticket;

  Future<List<User>> getUserAll() async {

    List<User> userList= [];

    var response = await dio.get("$url/user/all");
    var responseData = response.data['data'];


    responseData
        .map((data) => {
              userList.add(User.fromJson(data)),
            })
        .toList();


    return userList;
  }
}