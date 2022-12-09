// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/user/user.dart';

class EditUser extends StatefulWidget {
  final BuildContext context;
  User user;
  EditUser({
    Key? key,
    required this.context,
    required this.user,
  }) : super(key: key);

  @override
  State<EditUser> createState() => _EditUser();
}

class _EditUser extends State<EditUser> {
  TextEditingController forFirstName = TextEditingController();
  TextEditingController forLastName = TextEditingController();
  TextEditingController forEmail = TextEditingController();
  TextEditingController forPassword = TextEditingController();

  UserController userController = UserController();
  @override
  Widget build(context) {
    forFirstName.text = widget.user.firstName;
    forLastName.text = widget.user.lastName;
    forEmail.text = widget.user.email;
    forPassword.text = widget.user.password;

    return IconButton(
      onPressed: () => _dialogBuilder(context),
      icon: Icon(
        Icons.edit_outlined,
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
          content: Card(
            elevation: 5,
            color: Colors.grey.shade200,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text(
                      "First Name",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(23, 0, 0, 0),
                    child: Text(
                      "Last Name",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: TextField(
                      controller: forLastName,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: TextField(
                      controller: forEmail,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: TextField(
                      // obscureText: true,
                      controller: forPassword,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
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
                        userID: widget.user.userID,
                        firstName: fname,
                        lastName: lname,
                        email: email,
                        password: password);

                    await userController.saveUser(newUser).then((value) =>
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarSuccess));

                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
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
