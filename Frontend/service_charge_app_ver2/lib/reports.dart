import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navDrawer.dart';

class Reports extends StatelessWidget{
  const Reports ({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Reports'),
        backgroundColor: Colors.blue,
      ),
      drawer: const NavigationDrawer(),
    );
  }
}