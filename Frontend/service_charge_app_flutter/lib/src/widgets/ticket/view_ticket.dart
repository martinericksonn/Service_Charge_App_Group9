// ignore_for_file: unused_field, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:service_charge_app/src/controller/ticket_controller.dart';

import 'package:service_charge_app/src/entity/ticket/ticket.dart';
import 'package:service_charge_app/src/widgets/editForAdmin.dart';
import 'package:service_charge_app/src/widgets/ticket/edit_ticket_admin_view.dart';

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
    "User ID",
    "Category ID",
    "Status",
    "Subject",
    "Description",
    "Date",
    "Actions",
  ];

  TicketController ticketController = TicketController();

  @override
  Widget build(BuildContext context) {
    return table();
  }

  Widget table() {
    return FutureBuilder<List<Ticket>>(
      future: ticketController.getTicketAll(),
      builder: (BuildContext context, AsyncSnapshot<List<Ticket>> snapshot) {
        
        if (!snapshot.hasData) {
        
          // ignore: curly_braces_in_flow_control_structures
          return Center(
            child: Expanded(
              child: const SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        List<Ticket> ticket = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: DataTable(
              columns: ticketAtributes
                  .map((atribute) => tabTitle(atribute))
                  .toList(),
              rows: ticket
                  .map(
                    (ticket) => dataRows(ticket, context),
                  )
                  .toList()),
        );
      },
    );
  }

  DataRow dataRows(Ticket ticket, BuildContext context) {
    return DataRow(
      cells: <DataCell>[
        DataCell(
          Text(ticket.ticketID.toString()),
        ),
        DataCell(
          Text(ticket.userID.toString()),
        ),
        DataCell(
          Text(ticket.categoryID.toString()),
        ),
        DataCell(
          Text(ticket.status),
        ),
        DataCell(
          Text(ticket.subject),
        ),
        DataCell(
          Text(ticket.description),
        ),
        DataCell(
          Text(ticket.date.toString()),
        ),
        DataCell(SizedBox(
          child: Row(
            children: [
              EditTixAdmin(ticket: ticket, context: context),
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
    );
  }

  DataColumn tabTitle(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(fontStyle: FontStyle.italic),
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
