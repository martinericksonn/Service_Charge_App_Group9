import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/role_controller.dart';
import 'package:service_charge_app/src/entity/role/Role.dart';

// List<String> roles = [
//   "CEO",
//   "COO",
//   "Accountant",
//   "HR",
//   "Manager",
//   "Head HR",
//   "--",
// ];

class RolesDropdown extends StatefulWidget {
  final TextEditingController forRole;
  const RolesDropdown({
    super.key,
    required this.forRole,
  });

  @override
  State<RolesDropdown> createState() => _RolesDropdownState();
}

class _RolesDropdownState extends State<RolesDropdown> {
  RoleController roleController = RoleController();

  late String rolesID = '--';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Role>>(
      future: roleController.getAllRole(),
      builder: (BuildContext context, AsyncSnapshot<List<Role>> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        List<Role> roleList = snapshot.data!;
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

  int findRoleID(String roleValue, List<Role> role) {
    for (var element in role) {
      if (element.role == roleValue) return element.roleID;
    }
    return 0;
  }
}
