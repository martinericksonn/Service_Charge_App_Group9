import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';

class TicketController {
  final url = ('http://127.0.0.1:8080/ticket');
  final dio = Dio();

  Future<List<Ticket>> getTicketAll() async {
    List<Ticket> ticketList = [];

    var response = await dio.get("$url/all");
  
    response.data['data']
        .map((data) => {
              ticketList.add(Ticket.fromJson(data)),
            })
        .toList();

    return ticketList;
  }
    Future<List<Ticket>> getTicketAllCategoryID(int id) async {
    List<Ticket> ticketList = [];

    var response = await dio.get("$url/ticket-category/$id");
  
    response.data['data']
        .map((data) => {
              ticketList.add(Ticket.fromJson(data)),
            })
        .toList();

    return ticketList;
  }


   Future<List<Ticket>> getTicketAllCategoryByUserID(int id) async {
    List<Ticket> ticketList = [];

    var response = await dio.get("$url/ticket-category-by-user/$id");
  
    response.data['data']
        .map((data) => {
              ticketList.add(Ticket.fromJson(data)),
            })
        .toList();

    return ticketList;
  }


    Future<List<Ticket>> getTicketAllStatus(String status) async {
    List<Ticket> ticketList = [];

    var response = await dio.get("$url/ticket-status/$status");
  
    response.data['data']
        .map((data) => {
              ticketList.add(Ticket.fromJson(data)),
            })
        .toList();

    return ticketList;
  }

  Future<Ticket> getTicketById(int id) async {
    Ticket ticket = Ticket();

    var response = await dio.get("$url/id");
    response.data['data']
        .map((data) => {
              ticket = Ticket.fromJson(data),
            })
        .toList();

    return ticket;
  }

  Future<dynamic> saveTicket(String endpoint, Ticket ticket) async {
    try {
      var formData = FormData.fromMap(ticket.toJson());
      var response = await dio.post(
        "$url/$endpoint",
        data: formData,
      );

      return response;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> deleteTicket(int id) async {
    try {
      var response = await dio.delete(
        "$url/delete/$id",
      );

      return response;
    } catch (e) {
      return e;
    }
  }
}
