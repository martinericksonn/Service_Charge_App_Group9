// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:service_charge_app/src/widgets/ticket/datePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/filePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/ticketStat.dart';
import 'package:service_charge_app/src/widgets/user/assignees.dart';


class CreateTicket extends StatelessWidget {
  const CreateTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController forDescription = TextEditingController();
    TextEditingController forSubject1 = TextEditingController();
    TextEditingController forSubject2 = TextEditingController();

    return SingleChildScrollView(
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("New Ticket", style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          ),),
                  ),
                  SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Card(
              elevation: 5,
              color: Colors.grey.shade200,
              child: Center(
                child: Column(
                  children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Text("Subject", style: 
                                    TextStyle(fontSize: 12),),
                            ),
                            SizedBox(width: 3,),
                          SizedBox(
                            width: 905,
                            height: 50,
                            child: 
                                 Padding(
                                        padding: EdgeInsets.all(10),
                                        child: TextField(
                                        controller: forSubject1,
                                        decoration: InputDecoration(
                                        border: OutlineInputBorder( 
                                        borderSide: BorderSide(
                                        width: 2, color: Colors.grey), 
                                              ),
                                        ),
                                          ),
                                      ),
                                
                          ),
                        ],
                      ),     
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 7, 5, 0),
                            child: Text("Description", style: 
                                      TextStyle(fontSize: 12),),
                          ),
                          SizedBox(
                            width: 900,
                            child: 
                                  Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: TextField(
                                    maxLines: 5,
                                    controller: forDescription,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder( 
                                        borderSide: BorderSide(
                                        width: 2, color: Colors.grey), 
                                              ),
                                        ),
                                        ),
                                  ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(34, 0, 5, 0),
                            child: Text("Status", style: 
                                      TextStyle(fontSize: 12),),
                          ),        
                          SizedBox(
                            height: 50,
                            child: TixStatusDropDown()),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Text("Select Assignee", style: 
                                      TextStyle(fontSize: 12),),
                          ),
                          SizedBox(
                            height: 50,
                            child: AssigneeDropDown()),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Text("Date Started", style: 
                                      TextStyle(fontSize: 12),),
                          ),
                          SizedBox(
                            height: 50,
                            width: 120,
                            child: DatePicker()),
                        ],
                      ),
                      FilePcker(),
                      Container(
                                padding: EdgeInsets.all(10),
                                height: 60,
                                width: 100,
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
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
      
  }
}