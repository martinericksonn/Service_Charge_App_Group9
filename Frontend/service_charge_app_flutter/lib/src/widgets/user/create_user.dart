// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';
import 'dart:math';

import 'package:service_charge_app/src/entity/user/user.dart';
import 'package:service_charge_app/src/widgets/ticket/create_ticket/roles_dropdown.dart';

class AddClientUser {
  UserController userController = UserController();
  RoleController roleController = RoleController();

  Future<void> dialogBuilder(BuildContext context) {
    TextEditingController forFirstName = TextEditingController();
    TextEditingController forLastName = TextEditingController();

    TextEditingController forRole = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
          title: const Text(
            'Add New User',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Card(
              elevation: 5,
              color: Colors.grey.shade200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "First Names",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: forFirstName,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Last Name",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: forLastName,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          "Roles",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        RolesDropdown(forRole: forRole),
                      ],
                    ),
                  ]),
            ),
          ),
          actions: <Widget>[
            SizedBox(
              height: 35,
              width: 70,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                onPressed: () async {
                  String fname = forFirstName.text;
                  String lname = forLastName.text;

                  if (fname.isEmpty || lname.isEmpty || forRole.text == '0') {
                    ScaffoldMessenger.of(context).showSnackBar(snackBarError);
                    return;
                  }

                  String email =
                      "${lname.trim().replaceAll(' ', '')}.${fname.trim().replaceAll(' ', '')}@gmail.com";
                  String password = generatePassword(8);

                  User newUser = User(
                      firstName: fname,
                      lastName: lname,
                      email: email.toLowerCase(),
                      password: password);

                  await userController.saveUser(newUser).then((value) {
                    roleController
                        .saveUserRole(
                          UserRole(
                            roleID: int.parse(forRole.text),
                            userID: value.data["data"]['userID'],
                          ),
                        )
                        .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarSuccess));

                    Navigator.pop(context);
                  });
                },
                child: const Text("Add"),
              ),
            ),
          ],
        );
      },
    );
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String generatePassword(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );

final snackBarError = SnackBar(
  backgroundColor: Colors.red,
  content: const Text(
    'Error: missing User fields',
    style: TextStyle(
      color: Colors.white,
    ),
  ),
  action: SnackBarAction(
    textColor: Colors.white,
    label: 'ok',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);

final snackBarSuccess = SnackBar(
  backgroundColor: Colors.green,
  content: const Text(
    'User successfuly created',
    style: TextStyle(
      color: Colors.white,
    ),
  ),
  action: SnackBarAction(
    textColor: Colors.white,
    label: 'ok',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);
