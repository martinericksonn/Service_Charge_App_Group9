// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service_charge_app/src/widgets/assignees.dart';

class createTicket extends StatelessWidget {
  const createTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController forDescription = TextEditingController();
    TextEditingController forSubject1 = TextEditingController();
    TextEditingController forSubject2 = TextEditingController();

    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 370,
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Create Ticket",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //ID NUMBER FOR TICKETS
                  Text('ID: Auto generated number'),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: forSubject1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Subject',
                        hintText: 'Enter your subject'),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      maxLines: 2,
                      minLines: 2,
                      controller: forDescription,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                          hintText: 'Enter your Description'),
                    ),
                  ),

                  AssigneeDropDown(),
                  AssigneeDropDown(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 60,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        forDescription.clear();
                        forSubject1.clear();
                        forSubject2.clear();
                      },
                      child: Text("Create"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
