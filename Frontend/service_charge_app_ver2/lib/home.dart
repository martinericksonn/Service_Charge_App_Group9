import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navDrawer.dart';

class HomePage extends StatelessWidget{
  const HomePage ({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Dashboard'),
        backgroundColor: Colors.blue,
      ),
      drawer: const NavigationDrawer(),
    );
  }
}