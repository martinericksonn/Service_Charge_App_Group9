// ignore_for_file: unused_field, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';

import '../entity/ticket.dart';

class ViewTicket extends StatefulWidget {
  ViewTicket({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewTicket> createState() => _ViewTicketState();
}

class _ViewTicketState extends State<ViewTicket> {
  TicketController ticketController = TicketController();
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return table();
  }

  Widget table() {
    return SingleChildScrollView(
      child: FutureBuilder<List<Ticket>>(
        future: ticketController.getTicket(),
        builder: (BuildContext context, AsyncSnapshot<List<Ticket>> snapshot) {
          if (!snapshot.hasData)
            // ignore: curly_braces_in_flow_control_structures
            return const SizedBox(
              height: 300,
              child: CircularProgressIndicator(),
            );

          List<Map<String, dynamic>> tickets =
              snapshot.data!.map((data) => data.toJson()).toList();
          print(tickets);
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'TicketID',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'AssigneeID',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'UserID',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Category',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Status',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Subject',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Description',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Date',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Actions',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
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
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit_outlined,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
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