import 'package:flutter/material.dart';

class AddClientUser extends StatefulWidget {
  const AddClientUser({super.key});

  @override
  State<AddClientUser> createState() => _AddClientUSerState();
}

class _AddClientUSerState extends State<AddClientUser> {

 @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 45,
          width: 70,
          child: OutlinedButton(
            onPressed: () => _dialogBuilder(context),
            child: const Text('Add User'),
          ),
        ),
      );
    
  }





Future<void> _dialogBuilder(BuildContext context) {
  TextEditingController forFirstName = TextEditingController();
  TextEditingController forLastName = TextEditingController();
  TextEditingController forEmail = TextEditingController();
  TextEditingController forPassword = TextEditingController();
  
    return showDialog<void>(
      
      context: context,
      builder: (BuildContext context) {
        
        return AlertDialog(
          shape: const RoundedRectangleBorder(
    borderRadius:
      BorderRadius.all(
        Radius.circular(15.0))),
        insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
          title: const Text('Add New User', style: TextStyle(
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
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image(
                          image: AssetImage('assets/images/empty_profile.png'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Text("First Name", style: 
                                    TextStyle(fontSize: 12),),
                            ),
                            const SizedBox(width: 3,),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: 
                                 Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                        controller: forFirstName,
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
                          const Padding(
                              padding: EdgeInsets.fromLTRB(23, 0, 0, 0),
                              child: Text("Last Name", style: 
                                    TextStyle(fontSize: 12),),
                            ),
                            const SizedBox(width: 3,),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: 
                                 Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                        controller: forLastName,
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
                        children: [
                          const SizedBox(width: 15,),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Text("Email", style: 
                                    TextStyle(fontSize: 12),),
                            ),
                            const SizedBox(width: 3,),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: 
                                 Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                        controller: forEmail,
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
                          const Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Text("Password", style: 
                                    TextStyle(fontSize: 12),),
                            ),
                            const SizedBox(width: 3,),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: 
                                 Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                        obscureText: true,
                                        controller: forPassword,
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
                                child: const Text("Add"),
                              ),
                            ),
            ),
          ],
        );
      },
    );
}
}
