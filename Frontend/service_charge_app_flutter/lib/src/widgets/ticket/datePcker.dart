
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker ({super.key,});

  @override
  State<DatePicker> createState() => _AssigneeDropDownState();
}

class _AssigneeDropDownState extends State<DatePicker> {
TextEditingController dateInput = TextEditingController();
 
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Center(
              child: TextField(
            controller: dateInput,
            //editing controller of this TextField
            readOnly: true,
            //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));
 
              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  dateInput.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
            },
          )),
    );
  }
}