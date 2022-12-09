import 'package:flutter/material.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, use_build_context_synchronously
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';
import 'package:service_charge_app/src/entity/user/user.dart';
import 'package:service_charge_app/src/widgets/ticket/create_ticket/roles_dropdown.dart';

class EditUser {
  User user;
  EditUser({
    Key? key,
    required this.user,
  });

  TextEditingController forFirstName = TextEditingController();
  TextEditingController forLastName = TextEditingController();
  TextEditingController forEmail = TextEditingController();
  TextEditingController forPassword = TextEditingController();

  UserController userController = UserController();

  Future<void> dialogBuilder(BuildContext context) {
    forFirstName.text = user.firstName;
    forLastName.text = user.lastName;
    forEmail.text = user.email;
    forPassword.text = user.password;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
          title: const Text(
            'Edit User',
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Email",
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
                        controller: forEmail,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Password",
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
                        controller: forPassword,
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
                  String email = forEmail.text;
                  String password = forPassword.text;

                  if (fname.isEmpty ||
                      lname.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBarError);
                    return;
                  }

                  User newUser = User(
                      userID: user.userID,
                      firstName: fname,
                      lastName: lname,
                      email: email,
                      password: password);

                  await userController.saveUser(newUser);

                  ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ),
          ],
        );
      },
    );
  }
}

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
    'User successfuly edited',
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