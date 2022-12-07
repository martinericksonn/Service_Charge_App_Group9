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
  const RolesDropdown({
    super.key,
  });

  @override
  State<RolesDropdown> createState() => _RolesDropdownState();
}

class _RolesDropdownState extends State<RolesDropdown> {
  RoleController roleController = RoleController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Role>>(
        future: roleController.getAllRole(),
        builder: (BuildContext context, AsyncSnapshot<List<Role>> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          var roleList = snapshot.data!;
          var roles = roleList.map((e) => e.role).toList();
          roles.add('--');
          var rolesID = roles.last;

          return Container(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 50,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  onChanged: (String? value) {
                    setState(() {
                      rolesID = value!;
                    });
                  },
                  value: rolesID,
                  items: roles.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        });
  }
}
