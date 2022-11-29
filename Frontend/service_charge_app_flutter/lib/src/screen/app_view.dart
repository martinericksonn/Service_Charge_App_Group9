// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Service Charge App"),
          actions: [
            SizedBox(
              width: 350,
              child: TabBar(
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Text("Create Ticket"),
                  ),
                  Tab(text: "View Ticket"),
                  Tab(
                    text: "View User",
                  ),
                ],
              ),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("textfield sa gi sabotan"),
            ),
            Center(
              child: Text("table diri ako ra bahala"),
            ),
            Center(
              child: Text("unsa pa lain tabs?"),
            ),
          ],
        ),
      ),
    );
  }
}
