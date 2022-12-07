// ignore_for_file: unused_field, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/user/user.dart';

class ViewUser extends StatefulWidget {
  ViewUser({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  List userAtributes = [
    "User ID",
    "First Name",
    "Last Name",
    "Email",
    "Actions"
  ];
  UserController userController = UserController();
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return table();
  }

  Widget table() {
    return SingleChildScrollView(
      child: Container(
        // color: Colors.black12,
        padding: EdgeInsets.all(20),
        child: Container(
          color: Colors.white,
          child: FutureBuilder<List<User>>(
            future: userController.getUserAll(),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (!snapshot.hasData)
                // ignore: curly_braces_in_flow_control_structures
                return Center(
                  child: Expanded(
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );

              List<User> users = snapshot.data!;
              print(users);
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: DataTable(
                    columns: userAtributes
                        .map((atribute) => tabTitle(atribute))
                        .toList(),
                    rows: users
                        .map(
                          (user) => dataRows(user, context),
                        )
                        .toList()),
              );
            },
          ),
        ),
      ),
    );
  }

  DataRow dataRows(User user, BuildContext context) {
    return DataRow(
      cells: <DataCell>[
        DataCell(
          Text(user.userID.toString()),
        ),
        DataCell(
          Text(user.firstName),
        ),
        DataCell(
          Text(user.lastName),
        ),
        DataCell(
          Text(user.email),
        ),
        DataCell(SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () => inputDialog(context, user),
                icon: Icon(
                  Icons.edit_outlined,
                ),
              ),
              IconButton(
                onPressed: () => deleteDialog(context, user),
                icon: Icon(
                  Icons.delete_outline,
                ),
              )
            ],
          ),
        ))
      ],
    );
  }

  DataColumn tabTitle(String title) {
    return DataColumn(
      label: Expanded(
        child: Text(
          title,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Future<String?> inputDialog(BuildContext context, User user) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          user.userID.toString(),
        ),
        content: const Text('Atleast ni gana siya'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => {
              setState(() {
                userController.deleteUser(user.userID);
                Navigator.pop(context);
              })
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<String?> deleteDialog(BuildContext context, User user) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          "Are you sure?",
          style: TextStyle(
            color: Theme.of(context).errorColor,
          ),
        ),
        content: Row(
          children: [
            Text(
              'Delete user ',
            ),
            Text(
              '${user.userID}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => {
              setState(() {
                userController.deleteUser(user.userID);
                Navigator.pop(context);
              })
            },
            child: Text(
              'OK',
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
