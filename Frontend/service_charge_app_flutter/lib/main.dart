// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:service_charge_app/src/entity/ticket.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';


void main() async {
  
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
  
  

  // print(response.statusCode);
  // final responseList = response.data["data"];

  // // List<Ticket> ticket = [];
  // final projectList = responseList
  //     .map((data) => print(Ticket.fromJson(data)))
  //     .toList(); // projectList is a List<ProjectJson>
  // // print(projectList.runtimeType);
  // // print(ticket);
  // print("hello world end");

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
