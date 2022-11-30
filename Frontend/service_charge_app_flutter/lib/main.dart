import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:service_charge_app/src/entity/ticket.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

void main() async {
  // var url = Uri.parse('http://127.0.0.1:8080/ticket/all');
  //   url,
  //   // headers: {
  //   //   'Content-Type': 'text/plain',
  //   //   "Access-Control-Allow-Origin": "*",
  //   //   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
  //   //   "Access-Control-Allow-Headers":
  //   //       "Origin, X-Requested-With, Content-Type, Accept"
  //   // },
  // );
  // print(response);
  // HttpClientRequest request =
  //     await client.get('localhost', 8080, '/ticket/all');
  // HttpClientResponse response = await request.close();
  // final stringData = await response.transform(utf8.decoder).join();
  // print(stringData);
  // print("hello world start");
  var dio = Dio();
  var response = await dio.get("http://127.0.0.1:8080/ticket/all");

  print(response.statusCode);
  final responseList = json.decode(response.data["data"]) as List;
  final projectList = responseList
      .map((project) => Ticket.fromJson(project))
      .toList(); // projectList is a List<ProjectJson>
  print(projectList);

  print("hello world end");

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  // final settingsController = SettingsController(SettingsService());

  // // Load the user's preferred theme while the splash screen is displayed.
  // // This prevents a sudden theme change when the app is first displayed.
  // await settingsController.loadSettings();

  // // Run the app and pass in the SettingsController. The app listens to the
  // // SettingsController for changes, then passes it further down to the
  // // SettingsView.
  // runApp(MyApp(settingsController: settingsController));
}
