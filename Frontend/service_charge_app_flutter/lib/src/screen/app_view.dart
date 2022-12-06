// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:service_charge_app/src/routes/routes.dart';
import 'package:service_charge_app/src/widgets/ticket/view_ticket.dart';

import 'package:service_charge_app/src/widgets/user/view_users.dart';

import '../widgets/createTicket.dart';



class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: navbar(context),
        body: TabBarView(
          children: [
            CreateTicket(),
            ViewTicket(),
            ViewUser(),
          ],
        ),
      ),
    );
  }

  AppBar navbar(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.black12,
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
        width: 350,
        child: TabBar(indicatorColor: Colors.transparent, tabs: [
          Tab(
            text: "Create Ticket",
          ),
          Tab(
            text: "View Ticket",
          ),
          Tab(
            text: "View User",
          ),
        ]),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Martin Erickson Lapetaje",
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
