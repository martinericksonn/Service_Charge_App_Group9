// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';
import 'package:service_charge_app/src/entity/user/user.dart';

class DashboardClient extends StatelessWidget {
  final User user;
  TicketController tc = TicketController();
  DashboardClient({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              "Aging Tickets",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              FutureBuilder<List<Ticket>>(
                  future: tc.getTicketAllCategoryID(1001),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ticket>> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<Ticket> tickets = snapshot.data!;
                    return ticketCard("Sales Team", "${tickets.length} Ticket");
                  }),
              FutureBuilder<List<Ticket>>(
                  future: tc.getTicketAllCategoryID(1002),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ticket>> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<Ticket> tickets = snapshot.data!;
                    return ticketCard(
                        "Billing In-Charge", "${tickets.length} Ticket");
                  }),
              FutureBuilder<List<Ticket>>(
                  future: tc.getTicketAllCategoryID(1003),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ticket>> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<Ticket> tickets = snapshot.data!;
                    return ticketCard(
                        "Collection In-Charge", "${tickets.length} Ticket");
                  }),
              FutureBuilder<List<Ticket>>(
                  future: tc.getTicketAllCategoryID(1004),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ticket>> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<Ticket> tickets = snapshot.data!;
                    return ticketCard("Treasury", "${tickets.length} Ticket");
                  }),
              // ticketCard("Billing In-Charge", "180 Ticket"),
              // ticketCard("Collection In-Charge", "180 Ticket"),
              // ticketCard("Treasury", "180 Ticket"),
              SizedBox(
                width: 50,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              FutureBuilder<List<Ticket>>(
                  future: tc.getTicketAllStatus("New"),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ticket>> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<Ticket> tickets = snapshot.data!;
                    return ticketCard("New", "${tickets.length} Ticket");
                  }),
              FutureBuilder<List<Ticket>>(
                  future: tc.getTicketAllStatus("Pending"),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ticket>> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<Ticket> tickets = snapshot.data!;
                    return ticketCard("Pending", "${tickets.length} Ticket");
                  }),
              FutureBuilder<List<Ticket>>(
                  future: tc.getTicketAllStatus("On-Hold"),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ticket>> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<Ticket> tickets = snapshot.data!;
                    return ticketCard("On-Hold", "${tickets.length} Ticket");
                  }),
              FutureBuilder<List<Ticket>>(
                  future: tc.getTicketAllStatus("Completed"),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ticket>> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<Ticket> tickets = snapshot.data!;
                    return ticketCard("Completed", "${tickets.length} Ticket");
                  }),
              // ticketCard("New", "180 Ticket"),
              // ticketCard("Pending", "180 Ticket"),
              // ticketCard("On-Hold", "180 Ticket"),
              // ticketCard("Completed", "180 Ticket"),
              SizedBox(
                width: 50,
              )
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Generate Report"),
            ),
          )
        ],
      ),
    );
  }

  Flexible ticketCard(String title, String data) {
    return Flexible(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.article,
                    size: 22.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
