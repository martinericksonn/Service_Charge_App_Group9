import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/role/Role.dart';
import 'package:service_charge_app/src/entity/user/user.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:service_charge_app/src/widgets/ticket/edit_ticket_admin_view.dart';

class RolesAssigneeDropdown extends StatefulWidget {
  final TextEditingController forRole;
  final TextEditingController forAssignee;
  int defaultRoleID;
  int defaultAssigneeID;
  RolesAssigneeDropdown({
    super.key,
    required this.forRole,
    required this.forAssignee,
    this.defaultRoleID = 0,
    this.defaultAssigneeID = 0,
  });

  @override
  State<RolesAssigneeDropdown> createState() => _RolesAssigneeDropdownState();
}

class _RolesAssigneeDropdownState extends State<RolesAssigneeDropdown> {
  UserController userController = UserController();
  RoleController roleController = RoleController();
  late String rolesID = '--';
  late String assigneesID = '--';
  // List<String> names = ["--"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            width: 40,
          ),

          // SizedBox(width: 105),
          Row(
            children: [
              const Text(
                "Select Role",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              role()
            ],
          ),

          Row(
            children: [
              const Text(
                "Select Assignee",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              asignee(),
            ],
          ),
        ],
      ),
    );
  }

  Widget asignee() {
    widget.forRole.text = widget.defaultAssigneeID != 0
        ? widget.defaultRoleID.toString()
        : widget.forRole.text;
    try {
      return FutureBuilder<List<User>>(
        future:
            userController.getUsersFromRoleID(int.parse(widget.forRole.text)),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (!snapshot.hasData) {
            return const Text("--");
          }
          List<String> names = [];
          if (snapshot.hasData) {
            var userList = snapshot.data!;

            if (widget.defaultAssigneeID != 0) {
              assigneesID =
                  findRoleUserName(widget.defaultAssigneeID, userList);
              widget.defaultAssigneeID = 0;
            }

            for (var element in userList) {
              names.add("${element.firstName} ${element.lastName}");
            }
            names.add("--");

            return Container(
              width: 250,
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 50,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    onChanged: (String? value) {
                      setState(() {
                        assigneesID = value ?? "--";

                        widget.forAssignee.text =
                            findRoleUserID(value!, userList).toString();
                      });
                    },
                    value: assigneesID,
                    items: names.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      );
    } catch (e) {
      return const CircularProgressIndicator();
    }
  }

  FutureBuilder<List<Role>> role() {
    return FutureBuilder<List<Role>>(
      future: roleController.getAllRole(),
      builder: (BuildContext context, AsyncSnapshot<List<Role>> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        List<Role> roleList = snapshot.data!;
        if (widget.defaultRoleID != 0) {
          rolesID = findRoleName(widget.defaultRoleID, roleList);
          widget.defaultRoleID = 0;
        }
        roleList.add(Role(99, "--"));

        return Container(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 50,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: (var value) {
                  setState(() {
                    rolesID = value!;

                    widget.forRole.text =
                        findRoleID(value, roleList).toString();

                    assigneesID = "--";
                  });
                },
                value: rolesID,
                items: roleList.map((value) {
                  return DropdownMenuItem<String>(
                    value: value.role,
                    child: Text(value.role),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

int findRoleID(String roleValue, List<Role> roles) {
  for (var element in roles) {
    if (element.role == roleValue) return element.roleID;
  }
  return 0;
}

int findRoleUserID(String userName, List<User> users) {
  for (var element in users) {
    if ("${element.firstName} ${element.lastName}" == userName) {
      return element.userID;
    }
  }
  return 0;
}

String findRoleName(int id, List<Role> roles) {
  for (var element in roles) {
    if (element.roleID == id) return element.role;
  }
  return "--";
}

String findRoleUserName(int id, List<User> users) {
  for (var element in users) {
    if (element.userID == id) return "${element.firstName} ${element.lastName}";
  }

  return "--";
}
