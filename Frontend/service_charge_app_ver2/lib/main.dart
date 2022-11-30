import 'package:flutter/material.dart';
import 'package:service_charge_app_ver2/home.dart';
import 'package:service_charge_app_ver2/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Charge App',
      theme: ThemeData(fontFamily: 'Merriweather' ),
      home: LoginPage(),
    );
  }
}