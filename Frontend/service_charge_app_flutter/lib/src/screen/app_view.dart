// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:service_charge_app/src/entity/user/user.dart';
import 'package:service_charge_app/src/routes/routes.dart';
import 'package:service_charge_app/src/widgets/ticket/admin_view/view_ticket.dart';
import 'package:service_charge_app/src/widgets/user/view_users.dart';

import '../widgets/ticket/dashboard.dart';

class AppView extends StatelessWidget {
  final User user;
  const AppView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: navbar(context),
        body: TabBarView(
          children: [
            CreateTicket(
              user: user,
            ),
            ViewTicket(),
            ViewUser(),
          ],
        ),
      ),
    );
  }

  AppBar navbar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(31, 112, 112, 112),
      centerTitle: true,
      leadingWidth: 200,
      leading: Center(
        child: Text("Service Charge App",
            style: Theme.of(context).textTheme.titleLarge),
      ),
      automaticallyImplyLeading: false,
      // backgroundColor: Colors.transparent,
      elevation: 0,
      title: SizedBox(
        width: 500,
        child: TabBar(indicatorColor: Colors.transparent, tabs: [
          Tab(
            text: "Dashboard",
          ),
          Tab(
            text: "Ticket Management",
          ),
          Tab(
            text: "User Management",
          ),
        ]),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "${user.firstName} ${user.lastName}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, routeLogin);
          },
          icon: Icon(Icons.logout_rounded),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
