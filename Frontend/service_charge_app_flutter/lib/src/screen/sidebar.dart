import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:service_charge_app/src/screen/app_view.dart';
import 'package:service_charge_app/src/screen/dashboard.dart';
import 'package:service_charge_app/src/screen/profile.dart';

import '../routes/routes.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Home'),
                  trailing: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => dashboard()));
                  },
                ),
                ListTile(
                  title: Text('Ticket Management'),
                  trailing: Icon(Icons.article),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AppView()));
                  },
                ),
                ListTile(
                  title: Text('Profile'),
                  trailing: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
