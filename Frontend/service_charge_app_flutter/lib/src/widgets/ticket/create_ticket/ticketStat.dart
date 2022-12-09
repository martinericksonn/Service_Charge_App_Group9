import 'package:flutter/material.dart';

List<String> tixStatus = [
  "New",
  "Pending",
  "Hold",
  "Completed",
  "--",
];

class TixStatusDropDown extends StatefulWidget {
  final TextEditingController forStatus;
  TixStatusDropDown({
    super.key,
    required this.forStatus,
  });

  @override
  State<TixStatusDropDown> createState() => _TixStatusDropDown();
}

class _TixStatusDropDown extends State<TixStatusDropDown> {
  String statID = tixStatus.last;

  @override
  Widget build(BuildContext context) {
    statID = widget.forStatus.text.isNotEmpty ? widget.forStatus.text : "--";
    return Container(
      padding: EdgeInsets.all(15.0),
      child: SizedBox(
        height: 50,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            onChanged: (String? value) {
              setState(() {
                statID = value!;
                widget.forStatus.text = value;
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
