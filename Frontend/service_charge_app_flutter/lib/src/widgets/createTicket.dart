// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/widgets/rolesDropdown.dart';
import 'package:service_charge_app/src/widgets/ticket/datePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/filePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/ticketStat.dart';
import 'package:service_charge_app/src/widgets/user/assignees.dart';

class CreateTicket extends StatelessWidget {
  const CreateTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController forDescription = TextEditingController();
    TextEditingController forSubject1 = TextEditingController();

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
                    subject(forSubject1),
                    SizedBox(
                      height: 10,
                    ),
                    description(forDescription),
                    roleAssignee(),
                    statusAttachFile(),
                    SizedBox(
                      height: 10,
                    ),
                    createButton(
                      forDescription,
                      forSubject1,
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
    TextEditingController forSubject1,
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
          print(forSubject1.text);
          forDescription.clear();
          forSubject1.clear();
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
            children: const [
              Text(
                "Select Role",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              RolesDropdown(),
            ],
          ),

          Row(
            children: const [
              Text(
                "Select Assignee",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              AssigneeDropDown(),
            ],
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }

  Row description(TextEditingController forDescription) {
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

  Row subject(TextEditingController forSubject1) {
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
            controller: forSubject1,
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
