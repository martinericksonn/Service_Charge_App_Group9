import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_charge_app_ver2/home.dart';
import 'package:service_charge_app_ver2/reports.dart';
import 'package:service_charge_app_ver2/tixManagement.dart';

class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({Key? key}) : super(key:key);

  @override 
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],))
    );
  }
  
  buildHeader(BuildContext context) {
    return Container(

    );

  }
  
  buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Dashboard'),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.confirmation_number),
            title: const Text('Ticket Management'),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const TicketManagement()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text('Reports'),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Reports()));
            },
          ),
        ],
        ),
    );

  }
}