import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';

class TicketController {
  final url = ('http://127.0.0.1:8080');
  final dio = Dio();
  late Ticket ticket;

  Future<List<Ticket>> getTicketAll() async {
    List<Ticket> ticketList = [];

    var response = await dio.get("$url/ticket/all");
    response.data['data']
        .map((data) => {
              ticketList.add(Ticket.fromJson(data)),
            })
        .toList();

    return ticketList;
  }

  Future<Ticket> getTicketById() async {
    Ticket ticket = Ticket();

    var response = await dio.get("$url/ticket/all");
    response.data['data']
        .map((data) => {
              ticket = Ticket.fromJson(data),
            })
        .toList();

    return ticket;
  }
}
