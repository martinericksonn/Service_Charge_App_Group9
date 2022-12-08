// ignore_for_file: public_member_api_docs, sort_constructors_first, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';

import '../../entity/user/user.dart';

// List<String> assignees = [
//   "Captain America",
//   "Iron Man",
//   "Black Widow",
//   "Hulk",
//   "Thor",
//   "Hawkeye",
//   "Wanda",
//   "Vision",
//   "Spiderman",
//   "--",
// ];

class AssigneeDropDown extends StatefulWidget {
  TextEditingController forAssignee;
  TextEditingController forRole;

  AssigneeDropDown({
    Key? key,
    required this.forAssignee,
    required this.forRole,
  }) : super(key: key);

  @override
  State<AssigneeDropDown> createState() => _AssigneeDropDownState();
}

class _AssigneeDropDownState extends State<AssigneeDropDown> {
  RoleController roleController = RoleController();
  UserController uc = UserController();

  String assigneesID = '--';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: uc.getUsersFromRoleID(int.parse(widget.forRole.text)),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (!snapshot.hasData) {
          return const Text("--");
        }
        List<User> roleList = snapshot.data!;
        roleList.add(
          User(firstName: "--"),
        );

        return Container(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 50,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: (String? value) {
                  assigneesID = value!;
                },
                value: assigneesID,
                items: roleList.map((value) {
                  return DropdownMenuItem<String>(
                    value: "${value.firstName} ${value.lastName}".trim(),
                    child: Text("${value.firstName} ${value.lastName}".trim()),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  List<int> findUserIDs(int roleID, List<UserRole> userRole) {
    List<int> userName = [];

    for (var element in userRole)
      if (element.roleID == roleID) userName.add(element.userID);

    return userName;
  }

  Future<List<String>> findUserNames(List<int> ids) async {
    List<String> userNames = [];

    UserController userController = UserController();
    List<User> userList = await userController.getUserAll();
    for (var elementIds in ids)
      for (var elementUsers in userList)
        if (elementIds == elementUsers.userID)
          userNames.add("${elementUsers.firstName} ${elementUsers.lastName}");

    return userNames;
  }
}
