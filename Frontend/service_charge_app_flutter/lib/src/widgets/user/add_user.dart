// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';
import 'dart:math';

import 'package:service_charge_app/src/entity/user/user.dart';
import 'package:service_charge_app/src/widgets/ticket/create_ticket/roles_dropdown.dart';

class AddClientUser extends StatefulWidget {
  const AddClientUser({
    Key? key,
  }) : super(key: key);

  @override
  State<AddClientUser> createState() => _AddClientUSerState();
}

class _AddClientUSerState extends State<AddClientUser> {
  UserController userController = UserController();
  RoleController roleController = RoleController();
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: () => _dialogBuilder(context),
      child: Text("Add User"),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    TextEditingController forFirstName = TextEditingController();
    TextEditingController forLastName = TextEditingController();
    TextEditingController forEmail = TextEditingController();
    TextEditingController forPassword = TextEditingController();
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
          content: Card(
            elevation: 5,
            color: Colors.grey.shade200,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "First Name",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 3,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: forFirstName,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "Last Name",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 3,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: forLastName,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "Roles",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
          actions: <Widget>[
            Center(
              child: SizedBox(
                height: 35,
                width: 70,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () async {
                    String fname = forFirstName.text;
                    String lname = forLastName.text;

                    if (fname.isEmpty || lname.isEmpty) {
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

                    UserRole userRole = UserRole(userID: 2002, roleID: 1001);
                    await roleController.saveUserRole(userRole);

                    await userController.saveUser(newUser).then((value) =>
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarSuccess));
                    Navigator.pop(context);
                  },
                  child: const Text("Add"),
                ),
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
