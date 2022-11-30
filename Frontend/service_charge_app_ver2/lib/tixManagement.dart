import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navDrawer.dart';

class TicketManagement extends StatelessWidget{
  const TicketManagement ({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Ticket Management'),
        backgroundColor: Colors.blue,
      ),
      drawer: const NavigationDrawer(),
    );
  }
}