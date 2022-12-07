// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/widgets/rolesDropdown.dart';
import 'package:service_charge_app/src/widgets/ticket/datePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/filePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/ticketStat.dart';
import 'package:service_charge_app/src/widgets/user/assignees.dart';

class CreateTicket extends StatelessWidget {
  TextEditingController forDescription = TextEditingController();
  TextEditingController forSubject = TextEditingController();
  TextEditingController forRole = TextEditingController(text: '0');
  TextEditingController forAssignee = TextEditingController();
  TextEditingController forStatus = TextEditingController();

  CreateTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 300, right: 300, top: 20),
      // color: Colors.green,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "New Ticket",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    subject(),
                    SizedBox(
                      height: 10,
                    ),
                    description(),
                    roleAssignee(),
                    statusAttachFile(),
                    SizedBox(
                      height: 10,
                    ),
                    createButton(
                      forDescription,
                      forSubject,
                      forRole,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Container createButton(
    TextEditingController forDescription,
    TextEditingController forSubject,
    TextEditingController forRole,
  ) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      width: 100,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
        onPressed: () {
          print(forDescription.text);
          print(forSubject.text);
          print(forRole.text);
          forDescription.clear();
          forSubject.clear();
        },
        child: Text("Create"),
      ),
    );
  }

  Widget statusAttachFile() {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 40,
          ),
          Row(
            children: const [
              Text(
                "Status",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              TixStatusDropDown(),
            ],
          ),
          // Row(
          //   children: const [
          //     Text(
          //       "Date Started",
          //       style: TextStyle(
          //         fontSize: 12,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 150,
          //       child: DatePicker(),
          //     ),
          //   ],
          // ),
          SizedBox(
            width: 150,
            child: FilePcker(),
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }

  Widget roleAssignee() {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            width: 40,
          ),

          // SizedBox(width: 105),
          Row(
            children: [
              Text(
                "Select Role",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              RolesDropdown(
                forRole: forRole,
              ),
            ],
          ),

          Row(
            children: [
              Text(
                "Select Assignee",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              AssigneeDropDown(
                forAssignee: forAssignee,
                roleID: int.parse(forRole.text),
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }

  Row description() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            "Description",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            maxLines: 5,
            controller: forDescription,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row subject() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            "Subject",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: forSubject,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
