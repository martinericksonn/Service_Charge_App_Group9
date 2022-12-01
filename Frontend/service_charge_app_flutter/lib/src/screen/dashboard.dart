import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text("Dashboard"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.airplane_ticket),
              label: Text("Ticket Management"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.report),
              label: Text("Reports"),
            ),
          ], selectedIndex: 0),
        ],
      ),
    );
  }
}
