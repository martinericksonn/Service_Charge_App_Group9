// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/entity/role/Role.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';
import 'package:service_charge_app/src/entity/user/user.dart';

class DashboardClient extends StatelessWidget {
  final User user;
  TicketController tc = TicketController();
  RoleController rc = RoleController();
  DashboardClient({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: rc.getUserRoleName(user.userID),
        // rc.findRoleIdByRole(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          String role = snapshot.data!;

          return FutureBuilder<Role>(
            future: rc.findRoleIdByRole(role),
            // rc.findRoleIdByRole(),
            builder: (BuildContext context, AsyncSnapshot<Role> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              Role roleID = snapshot.data!;
              return Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Aging Tickets for ",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            role,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 50,
                        ),
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
                          width: 100,
                        ),

                        FutureBuilder<List<Ticket>>(
                            future: tc.findTicketStatusByUserIdAndRoleId(
                                roleID.roleID, "On-Hold"),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Ticket>> snapshot) {
                              if (!snapshot.hasData)
                                return CircularProgressIndicator();
                              List<Ticket> tickets = snapshot.data!;
                              return ticketCard(
                                  "On-Hold", "${tickets.length} Ticket");
                            }),
                        FutureBuilder<List<Ticket>>(
                            future: tc.findTicketStatusByUserIdAndRoleId(
                                roleID.roleID, "Completed"),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Ticket>> snapshot) {
                              if (!snapshot.hasData)
                                return CircularProgressIndicator();
                              List<Ticket> tickets = snapshot.data!;
                              return ticketCard(
                                  "Completed", "${tickets.length} Ticket");
                            }),
                        // ticketCard("New", "180 Ticket"),
                        // ticketCard("Pending", "180 Ticket"),
                        // ticketCard("On-Hold", "180 Ticket"),
                        // ticketCard("Completed", "180 Ticket"),
                        SizedBox(
                          width: 100,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        FutureBuilder<List<Ticket>>(
                            future: tc.findTicketStatusByUserIdAndRoleId(
                                roleID.roleID, "New"),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Ticket>> snapshot) {
                              if (!snapshot.hasData)
                                return CircularProgressIndicator();
                              List<Ticket> tickets = snapshot.data!;
                              return ticketCard(
                                  "New", "${tickets.length} Ticket");
                            }),
                        FutureBuilder<List<Ticket>>(
                            future: tc.findTicketStatusByUserIdAndRoleId(
                                roleID.roleID, "Pending"),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Ticket>> snapshot) {
                              if (!snapshot.hasData)
                                return CircularProgressIndicator();

                              print(snapshot.data);
                              for (Ticket element in snapshot.data!)
                                print(element.toJson());
                              List<Ticket> tickets = snapshot.data!;

                              return ticketCard(
                                  "Pending", "${tickets.length} Ticket");
                            }),
                        SizedBox(
                          width: 100,
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
                    ),
                  ],
                ),
              );
            },
          );
        });
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
