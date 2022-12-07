// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';

import 'package:service_charge_app/src/screen/dashboard.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

Future<void> main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const MyApp(),
//     );
//   }
// }
