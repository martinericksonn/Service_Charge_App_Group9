import 'package:flutter/material.dart';
import 'package:service_charge_app/src/widgets/ticket/create_ticket/filePcker.dart';


class EditTixClient extends StatefulWidget {
  const EditTixClient({super.key});

  @override
  State<EditTixClient> createState() => _EditForAdminState();
}

class _EditForAdminState extends State<EditTixClient> {

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
        insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
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
