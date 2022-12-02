
import 'package:flutter/material.dart';


  List<String> country = [
    "Captain America",
    "Iron Man",
    "Black Widow",
    "Hulk",
    "Thor",
    "Hawkeye",
    "Wanda",
    "Vision",
    "Spiderman"
  ];

class AssigneeDropDown extends StatefulWidget {
  const AssigneeDropDown ({super.key,});

  @override
  State<AssigneeDropDown> createState() => _AssigneeDropDownState();
}

class _AssigneeDropDownState extends State<AssigneeDropDown> {
String countryID = country.first;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Select Assignee:"),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  onChanged: (String? value) {
                   setState(() {
                    countryID = value!;
                        });
                    },
                  value: countryID,
                  items: country.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                
                ),
              ),
            ]
            ),
      );
  }
}