import 'package:service_charge_app/src/entity/ticket.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class TicketController {
  final url = ('http://127.0.0.1:8080');
  final dio = Dio();
  late Ticket ticket;

  Future<List<Ticket>> getTicket() async {
    print("ticketListIn");
    List<Ticket> ticketList = [];

    var response = await dio.get("$url/ticket/all");
    var responseData = response.data['data'];

    print(responseData);
    responseData
        .map((data) => {
              ticketList.add(Ticket.fromJson(data)),
            })
        .toList();
    print("ticketListOUt");
    print(response.statusCode);
    print("response.statusCode");
    return ticketList;
  }
}
