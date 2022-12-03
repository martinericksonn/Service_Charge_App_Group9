// ignore_for_file: unused_field, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:intl/date_symbol_data_http_request.dart';

import 'package:intl/intl.dart';

import '../entity/ticket.dart';

class ViewTicket extends StatefulWidget {
  ViewTicket({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewTicket> createState() => _ViewTicketState();
}

class _ViewTicketState extends State<ViewTicket> {
  List<String> ticketAtributes = [
    "Ticket ID",
    "Assignee ID",
    "User ID",
    "Category",
    "Status",
    "Subject",
    "Description",
    "Date",
    "Actions",
  ];
  TicketController ticketController = TicketController();
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return table();
  }

  DataColumn tabTitle(String title) {
    return DataColumn(
      label: Expanded(
        child: Text(
          title,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget table() {
    return SingleChildScrollView(
      child: FutureBuilder<List<Ticket>>(
        future: ticketController.getTicket(),
        builder: (BuildContext context, AsyncSnapshot<List<Ticket>> snapshot) {
          if (!snapshot.hasData)
            // ignore: curly_braces_in_flow_control_structures
            return Center(
              child: const SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            );

          List<Map<String, dynamic>> tickets =
              snapshot.data!.map((data) => data.toJson()).toList();
          print(tickets);
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: DataTable(
                columns: ticketAtributes
                    .map((atribute) => tabTitle(atribute))
                    .toList(),
                rows: tickets
                    .map(
                      (ticket) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(ticket['ticketID'].toString())),
                          DataCell(Text(ticket['assigneeID'].toString())),
                          DataCell(Text(ticket['userID'].toString())),
                          DataCell(Text(ticket['category'].toString())),
                          DataCell(Text(ticket['status'])),
                          DataCell(Text(ticket['subject'])),
                          DataCell(Text(ticket['description'])),
                          DataCell(Text(ticket['date'].toString())),
                          DataCell(SizedBox(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => inputDialog(context),
                                  icon: Icon(
                                    Icons.edit_outlined,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => inputDialog(context),
                                  icon: Icon(
                                    Icons.delete_outline,
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                    .toList()),
          );
        },
      ),
    );
  }

  Future<String?> inputDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Okay'),
        content: const Text('Atleast ni gana siya'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
// const <DataRow>[
                
                // DataRow(
                //   cells: <DataCell>[
                    
                //     DataCell(Text('Janine')),
                //     DataCell(Text('43')),
                //     DataCell(Text('Professor')),
                //     DataCell(Text('Janine')),
                //     DataCell(Text('43')),
                //     DataCell(Text('Professor')),
                //     DataCell(Text('Janine')),
                //     DataCell(Text('43')),
                //   ],
                // ),
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                     DataCell(Text('Professor')),
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                     DataCell(Text('Professor')),
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                   ],
//                 ),
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                     DataCell(Text('Professor')),
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                     DataCell(Text('Professor')),
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                   ],
//                 ),
//               ],