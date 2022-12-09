import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/entity/role/Role.dart';
import 'package:service_charge_app/src/entity/user/user.dart';

// import 'package:service_charge_app/src/entity/role/Role.dart';
// import '../../../entity/role/role.dart';

class RolesDropdown extends StatefulWidget {
  final TextEditingController forRole;
  int defaultRoleID;
  RolesDropdown({
    super.key,
    required this.forRole,
    this.defaultRoleID = 0,
  });

  @override
  State<RolesDropdown> createState() => _RolesDropdown();
}

class _RolesDropdown extends State<RolesDropdown> {
  RoleController roleController = RoleController();
  late String rolesID = '--';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Role>>(
      future: roleController.getAllRole(),
      builder: (BuildContext context, AsyncSnapshot<List<Role>> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        List<Role> roleList = snapshot.data!;
        List<String> rolesName = [];
        if (widget.defaultRoleID != 0) {
          rolesID = findRoleName(widget.defaultRoleID, roleList);
          widget.defaultRoleID = 0;
        }
        for (var element in roleList) {
          rolesName.add(element.role);
        }

        rolesName.add("--");

        return Container(
          padding: EdgeInsets.all(15.0),
          child: SizedBox(
            height: 50,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: (String? value) {
                  setState(() {
                    rolesID = value ?? "--";
                    widget.forRole.text =
                        findRoleID(rolesID, roleList).toString();
                  });
                },
                value: rolesID,
                items: rolesName.map((String value) {
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
  }
}

int findRoleID(String roleValue, List<Role> roles) {
  for (var element in roles) {
    if (element.role == roleValue) return element.roleID;
  }
  return 0;
}

String findRoleName(int id, List<Role> roles) {
  for (var element in roles) {
    if (element.roleID == id) return element.role;
  }
  return "--";
}
