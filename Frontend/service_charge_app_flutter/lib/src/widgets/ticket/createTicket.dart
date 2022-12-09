// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/widgets/rolesDropdown.dart';
import 'package:service_charge_app/src/widgets/ticket/datePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/filePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/ticketStat.dart';
import 'package:service_charge_app/src/widgets/user/assignees.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';

class CreateTicket extends StatelessWidget {
  TicketController ticketController = TicketController();
  RoleController roleController = RoleController();
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
                    createButton(context),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Container createButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      width: 100,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
        onPressed: () async {
          if (forDescription.text.isEmpty ||
              forSubject.text.isEmpty ||
              forRole.text.isEmpty ||
              forAssignee.text.isEmpty ||
              forStatus.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(snackBarError);
          } else {
            int userRoleID = await roleController.getUserRoleByIdInt(
                int.parse(forAssignee.text), int.parse(forRole.text));
            print(forAssignee.text);
            print(forRole.text);
            Ticket newTicket = Ticket(
              userID: 2001,
              description: forDescription.text,
              subject: forSubject.text,
              categoryID: userRoleID,
              status: forStatus.text,
            );

            await ticketController.saveTicket("create", newTicket).then(
                (value) => ScaffoldMessenger.of(context)
                    .showSnackBar(snackBarSuccess));
            // forDescription.clear();
            // forSubject.clear();
          }
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
            children: [
              Text(
                "Status",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              TixStatusDropDown(
                forStatus: forStatus,
              ),
            ],
          ),
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

  final snackBarError = SnackBar(
    backgroundColor: Colors.red,
    content: const Text(
      'Error: missing Ticket fields',
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
      'Ticket successfuly created',
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
              RolesAssigneeDropdown(
                forRole: forRole,
                forAssignee: forAssignee,
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
