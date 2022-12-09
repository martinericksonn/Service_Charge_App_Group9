// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';
import 'package:service_charge_app/src/entity/ticket/ticket.dart';
import 'package:service_charge_app/src/widgets/rolesDropdown.dart';
import 'package:service_charge_app/src/widgets/ticket/datePcker.dart';

import 'package:service_charge_app/src/widgets/ticket/filePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/ticketStat.dart';
import 'package:service_charge_app/src/widgets/user/assignees.dart';

class EditTixAdmin extends StatefulWidget {
  final BuildContext context;
  final Function refreshState;
  Ticket ticket;

  EditTixAdmin({
    Key? key,
    required this.context,
    required this.ticket,
    required this.refreshState,
  }) : super(key: key);

  @override
  State<EditTixAdmin> createState() => _EditForAdminState();
}

class _EditForAdminState extends State<EditTixAdmin> {
  TicketController ticketController = TicketController();
  RoleController roleController = RoleController();
  TextEditingController forDescription = TextEditingController();
  TextEditingController forSubject = TextEditingController();
  TextEditingController forRole = TextEditingController(text: '0');
  TextEditingController forAssignee = TextEditingController();
  TextEditingController forStatus = TextEditingController();

  @override
  Widget build(context) {
    forRole.text = widget.ticket.categoryID.toString();
    forDescription.text = widget.ticket.description;
    forStatus.text = widget.ticket.status;
    forSubject.text = widget.ticket.subject;

    return IconButton(
      onPressed: () async {
        _dialogBuilder(context);
        await roleController.getUserRoleById(5);
      },
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
          insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          title: const Text(
            'Edit Ticket',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Container(
            margin: EdgeInsets.only(left: 100, right: 100, top: 20),
            // color: Colors.green,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 35,
                  width: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      if (forDescription.text.isEmpty ||
                          forSubject.text.isEmpty ||
                          forRole.text.isEmpty ||
                          forAssignee.text.isEmpty ||
                          forStatus.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarError);
                      } else {
                        int userRoleID =
                            await roleController.getUserRoleByIdInt(
                                int.parse(forAssignee.text),
                                int.parse(forRole.text));

                        Ticket newTicket = Ticket(
                          ticketID: widget.ticket.ticketID,
                          userID: 2002,
                          description: forDescription.text,
                          subject: forSubject.text,
                          categoryID: userRoleID,
                          status: forStatus.text,
                        );
                        widget.ticket = newTicket;
                        await ticketController
                            .saveTicket("create", newTicket)
                            .then((value) => ScaffoldMessenger.of(context)
                                .showSnackBar(snackBarSuccess));
                        // forDescription.clear();
                        // forSubject.clear();
                        widget.refreshState;
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Save"),
                  ),
                ),
              ),
              // child: TextButton(
              //   style: TextButton.styleFrom(
              //     textStyle: Theme.of(context).textTheme.labelLarge,
              //   ),
              //   child: const Text('Save'),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
            ),
          ],
        );
      },
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
    return FutureBuilder<UserRole>(
        future: roleController.getUserRoleById(widget.ticket.categoryID),
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
