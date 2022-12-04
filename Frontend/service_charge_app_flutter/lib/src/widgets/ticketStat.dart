
import 'package:flutter/material.dart';


  List<String> tixStatus = [
    "New",
    "Pending",
    "In Process",
    "Approved",
    "Completed",
     "--",
  ];

class TixStatusDropDown extends StatefulWidget {
  const TixStatusDropDown ({super.key,});

  @override
  State<TixStatusDropDown> createState() => _TixStatusDropDown();
}

class _TixStatusDropDown extends State<TixStatusDropDown> {
String statID = tixStatus.last;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.0),
        child: SizedBox(
            height: 50,
            child:
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  onChanged: (String? value) {
                   setState(() {
                    statID = value!;
                        });
                    },
                  value: statID,
                  items: tixStatus.map((String value) {
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