import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:service_charge_app/src/screen/login_page.dart';
import 'package:service_charge_app/src/screen/dashboard.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
