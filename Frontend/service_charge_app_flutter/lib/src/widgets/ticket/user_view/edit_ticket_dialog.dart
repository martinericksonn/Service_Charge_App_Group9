// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';
import 'package:service_charge_app/src/entity/user/user.dart';
import 'package:service_charge_app/src/widgets/roles_assignee_dropdown.dart';

import 'package:service_charge_app/src/widgets/ticket/create_ticket/filePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/create_ticket/ticketStat.dart';

class EditTixUser {
  final BuildContext context;
  final User user;
  Ticket ticket;

  EditTixUser({
    required this.context,
    required this.ticket,
    required this.user,
  });

  TicketController ticketController = TicketController();
  RoleController roleController = RoleController();
  TextEditingController forDescription = TextEditingController();
  TextEditingController forSubject = TextEditingController();
  TextEditingController forRole = TextEditingController(text: '0');
  TextEditingController forAssignee = TextEditingController();
  TextEditingController forStatus = TextEditingController();

  // @override
  // Widget build(context) {

  //   return IconButton(
  //     onPressed: () async {
  //       addc.dialogBuilder(context);

  //     },
  //     icon: Icon(
  //       Icons.edit_outlined,
  //     ),
  //   );
  // }

  Future<void> editTicketDialog(BuildContext context) {
    forRole.text = ticket.categoryID.toString();
    forDescription.text = ticket.description;
    forStatus.text = ticket.status;
    forSubject.text = ticket.subject;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          title: const Text(
            'Edit Ticket',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Card(
            elevation: 5,
            color: Colors.grey.shade200,

            // color: Colors.green,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 15),
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
                        statusAttachFile(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 35,
                width: 70,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () async {
                    if (forStatus.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBarError);
                    } else {
                      Ticket newTicket = Ticket(
                        ticketID: ticket.ticketID,
                        userID: user.userID,
                        description: ticket.description,
                        subject: ticket.subject,
                        categoryID: ticket.categoryID,
                        status: forStatus.text,
                      );
                      ticket = newTicket;
                      print(ticket.toJson());
                      print(newTicket.toJson());
                      await ticketController
                          .saveTicket("create", newTicket)
                          .then((value) {
                        print(value);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarSuccess);
                      });
                      // forDescription.clear();
                      // forSubject.clear();

                      Navigator.of(context).pop();
                    }
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
    return FutureBuilder<UserRole>(
        future: roleController.getUserRoleById(ticket.categoryID),
        builder: (context, AsyncSnapshot<UserRole> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          UserRole userRole = snapshot.data!;
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
                      defaultAssigneeID: userRole.userID,
                      defaultRoleID: userRole.roleID,
                    ),
                  ],
                ),

                SizedBox(
                  width: 40,
                ),
              ],
            ),
          );
        });
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
            enabled: false,
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
            enabled: false,
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
