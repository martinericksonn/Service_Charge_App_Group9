
import 'package:flutter/material.dart';


  List<String> roles = [
    "CEO",
    "COO",
    "Accountant",
    "HR",
    "Manager",
    "Head HR",
     "--",
  ];

class RolesDropdown extends StatefulWidget {
  const RolesDropdown ({super.key,});

  @override
  State<RolesDropdown> createState() => _RolesDropdownState();
}

class _RolesDropdownState extends State<RolesDropdown> {
String rolesID = roles.last;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.0),
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
  }
}