import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';

import 'package:service_charge_app/src/screen/dashboard.dart';

Future<void> main() async {
  // runApp(const MyApp());

  RoleController roleController = RoleController();
  var roles = await roleController.getRolesAll();
  print(roles);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const dashboard(),
    );
  }
}
