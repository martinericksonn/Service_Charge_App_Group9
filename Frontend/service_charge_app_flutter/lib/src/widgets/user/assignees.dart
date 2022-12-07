// ignore_for_file: public_member_api_docs, sort_constructors_first, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/role/user_role.dart';
import 'package:service_charge_app/src/entity/user/user.dart';

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
  int? roleID;
  AssigneeDropDown({
    Key? key,
    required this.forAssignee,
    required this.roleID,
  }) : super(key: key);

  @override
  State<AssigneeDropDown> createState() => _AssigneeDropDownState();
}

class _AssigneeDropDownState extends State<AssigneeDropDown> {
  RoleController roleController = RoleController();

  String assigneesID = '--';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserRole>>(
      future: roleController.getAllUserRole(),
      builder: (BuildContext context, AsyncSnapshot<List<UserRole>> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        List<UserRole> roleList = snapshot.data!;
        List<int> userList = findUserIDs(widget.roleID ?? 0, roleList);

        return FutureBuilder<List<String>>(
          future: findUserNames(userList),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> userNames) {
            List<String> userStringList = userNames.data!;
            return Container(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(
                height: 50,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    onChanged: (String? value) {
                      setState(() {
                        assigneesID = value!;
                      });
                    },
                    value: assigneesID,
                    items: userStringList.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
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
