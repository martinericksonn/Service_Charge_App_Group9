
import 'package:flutter/material.dart';


  List<String> assignees = [
    "Captain America",
    "Iron Man",
    "Black Widow",
    "Hulk",
    "Thor",
    "Hawkeye",
    "Wanda",
    "Vision",
    "Spiderman",
     "--",
  ];

class AssigneeDropDown extends StatefulWidget {
  const AssigneeDropDown ({super.key,});

  @override
  State<AssigneeDropDown> createState() => _AssigneeDropDownState();
}

class _AssigneeDropDownState extends State<AssigneeDropDown> {
String assigneesID = assignees.last;


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
                assigneesID = value!;
                    });
                },
              value: assigneesID,
              items: assignees.map((String value) {
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