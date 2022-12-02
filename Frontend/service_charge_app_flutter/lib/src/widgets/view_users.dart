// ignore_for_file: unused_field, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';

import '../entity/ticket.dart';
import '../entity/user.dart';

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
      child: FutureBuilder<List<User>>(
        future: userController.getUserAll(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (!snapshot.hasData)
            // ignore: curly_braces_in_flow_control_structures
            return const SizedBox(
              height: 300,
              child: CircularProgressIndicator(),
            );

          List<Map<String, dynamic>> users =
              snapshot.data!.map((data) => data.toJson()).toList();
          print(users);
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: DataTable(
                columns: userAtributes
                    .map((atribute) => tabTitle(atribute))
                    .toList(),
                rows: users
                    .map(
                      (user) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(user['userID'].toString())),
                          DataCell(Text(user['firstName'])),
                          DataCell(Text(user['lastName'])),
                          DataCell(Text(user['email'])),
                          DataCell(SizedBox(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit_outlined,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete_outline,
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                    .toList()),
          );
        },
      ),
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
}
// const <DataRow>[
                
                // DataRow(
                //   cells: <DataCell>[
                    
                //     DataCell(Text('Janine')),
                //     DataCell(Text('43')),
                //     DataCell(Text('Professor')),
                //     DataCell(Text('Janine')),
                //     DataCell(Text('43')),
                //     DataCell(Text('Professor')),
                //     DataCell(Text('Janine')),
                //     DataCell(Text('43')),
                //   ],
                // ),
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                     DataCell(Text('Professor')),
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                     DataCell(Text('Professor')),
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                   ],
//                 ),
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                     DataCell(Text('Professor')),
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                     DataCell(Text('Professor')),
//                     DataCell(Text('Janine')),
//                     DataCell(Text('43')),
//                   ],
//                 ),
//               ],