import 'package:service_charge_app/src/entity/ticket.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class TicketController {
  final url = ('http://127.0.0.1:8080');
  final dio = Dio();
  late Ticket ticket;

  Future<List<Ticket>> getTicket() async {
    List<Ticket> ticketList = [];

    var response = await dio.get("$url/ticket/all");
    var responseData = response.data['data'];
    responseData.map((data) => ticketList.add(Ticket.fromJson(data)));
    print(ticketList);
    return ticketList;
  }
}
