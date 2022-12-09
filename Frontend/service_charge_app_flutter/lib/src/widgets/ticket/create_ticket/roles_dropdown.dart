import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/entity/role/Role.dart';

// import 'package:service_charge_app/src/entity/role/Role.dart';
// import '../../../entity/role/role.dart';

class RolesDropdown extends StatefulWidget {
  final TextEditingController forRole;
  RolesDropdown({
    super.key,
    required this.forRole,
  });

  @override
  State<RolesDropdown> createState() => _RolesDropdown();
}

class _RolesDropdown extends State<RolesDropdown> {
  RoleController roleController = RoleController();
  late String rolesID = '--';

  @override
  Widget build(BuildContext context) {
    rolesID = widget.forRole.text.isNotEmpty ? widget.forRole.text : "--";
    return FutureBuilder<List<Role>>(
      future: roleController.getAllRole(),
      builder: (BuildContext context, AsyncSnapshot<List<Role>> snapshot) {
        List<Role> roles = snapshot.data!;
        List<String> rolesName = [];

        for (var element in roles) {
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
                    rolesID = value!;
                    widget.forRole.text = findRoleID(rolesID, roles).toString();
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
