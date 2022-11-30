// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage ({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 138, 35, 35),
                Color(0xFE94057),
                Color(0xFFF27121),
              ]
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(right: 600),
                child: Text(
                     "Service Charge App",
                      style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            SizedBox(width: 250),
            Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 420,
                    width: 370,
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Username',
                                    hintText: 'Enter your username'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    hintText: 'Enter your secure password'),
                              ),
                            ),
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
                                ),
                                onPressed: () {},
                                child: Text("Continue", style: TextStyle(
                                  color: Colors.white,)
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Forget password?"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 30,),
               Padding(
                 padding: const EdgeInsets.only(right: 80),
                 child: Image.asset('assets/images/alliance_logo.png',
              height: 400,
              width: 400,
              ),
               ),
       
          ],
        ),

            ],
          )
        )
      ),
    );
  }
}