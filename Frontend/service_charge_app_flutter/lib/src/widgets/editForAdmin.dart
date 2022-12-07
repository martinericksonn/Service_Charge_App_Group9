import 'package:flutter/material.dart';
import 'package:service_charge_app/src/widgets/rolesDropdown.dart';
import 'package:service_charge_app/src/widgets/ticket/datePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/filePcker.dart';
import 'package:service_charge_app/src/widgets/ticket/ticketStat.dart';
import 'package:service_charge_app/src/widgets/user/assignees.dart';

class EditTixAdmin extends StatefulWidget {
  const EditTixAdmin({super.key});

  @override
  State<EditTixAdmin> createState() => _EditForAdminState();
}

class _EditForAdminState extends State<EditTixAdmin> {

 @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 45,
          width: 70,
          child: OutlinedButton(
            onPressed: () => _dialogBuilder(context),
            child: const Text('Edit'),
          ),
        ),
      );
    
  }





Future<void> _dialogBuilder(BuildContext context) {
  TextEditingController forDescription = TextEditingController();
    TextEditingController forSubject1 = TextEditingController();
  
    return showDialog<void>(
      
      context: context,
      builder: (BuildContext context) {
        
        return AlertDialog(
          shape: const RoundedRectangleBorder(
    borderRadius:
      BorderRadius.all(
        Radius.circular(15.0))),
        insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          title: const Text('Edit Ticket', style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          ),),
          content: 
          Card(
            elevation: 5,
              color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Text("Subject", style: 
                                    TextStyle(fontSize: 12),),
                            ),
                            const SizedBox(width: 3,),
                          SizedBox(
                            width: 905,
                            height: 50,
                            child: 
                                 Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                        controller: forSubject1,
                                        decoration: const InputDecoration(
                                          filled: true,
                                      fillColor: Colors.white,
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
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 7, 5, 0),
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
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
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
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Text("Select Role", style: 
                                      TextStyle(fontSize: 12),),
                          ),
                          const SizedBox(
                            height: 50,
                            child: RolesDropdown()
                            ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Text("Select Assignee", style: 
                                      TextStyle(fontSize: 12),),
                          ),
                          const SizedBox(
                            height: 50,
                            child: AssigneeDropDown()
                            ),
                        ],
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      Row(children: [
                        const Padding(
                            padding: EdgeInsets.fromLTRB(34, 0, 5, 0),
                            child: Text("Status", style: 
                                      TextStyle(fontSize: 12),),
                          ),        
                          const SizedBox(
                            height: 50,
                            child: TixStatusDropDown()
                            ),
                      ],),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          FilePcker(),
                        ],
                      ),
                  ]
                ),
          ),
          actions: <Widget>[
            Center(
              child: SizedBox(
                              height: 35,
                              width: 70,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Save"),
                              ),
                            ),
              // child: TextButton(
              //   style: TextButton.styleFrom(
              //     textStyle: Theme.of(context).textTheme.labelLarge,
              //   ),
              //   child: const Text('Save'),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
            ),
          ],
        );
      },
    );
}
}
