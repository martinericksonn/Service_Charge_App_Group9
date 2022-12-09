// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:service_charge_app/src/controller/user_controller.dart';
import 'package:service_charge_app/src/entity/user/user.dart';
import 'package:service_charge_app/src/routes/routes.dart';
import 'package:service_charge_app/src/screen/app_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserController uc = UserController();

  final Widget networkSvg = Expanded(
    child: Image.asset(
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      'assets/images/cloud_login_background.png',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Service Charge App',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 40,
              child: Image.asset(
                "assets/images/alliance_logo.png",
                fit: BoxFit.fitHeight,
              ),
            )
          ],
        ),
        actions: const [],
      ),
      body: Stack(children: [
        networkSvg,
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Container(
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
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                      hintText: 'Enter your username'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  controller: passwordController,
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
                                      foregroundColor: Colors.white),
                                  onPressed: () {
                                    if (emailController.text.isEmpty ||
                                        passwordController.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBarMissing);
                                      return;
                                    }

                                    uc
                                        .loginUser(emailController.text,
                                            passwordController.text)
                                        .then((value) {
                                      if (value.data["data"] != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AppView(
                                                    user: User.fromJson(
                                                        value.data["data"]),
                                                  )),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBarError);
                                      }
                                    });
                                    // Navigator.pushReplacementNamed(
                                    //     context, routeAppView);
                                  },
                                  child: Text("Continue"),
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
            ),
            Expanded(
              child: Container(
                  // child: Text("data"),
                  ),
            )
          ],
        ),
      ]),
    );
  }
}

final snackBarError = SnackBar(
  backgroundColor: Colors.red,
  content: const Text(
    'Error: Incorrect email or password ',
    style: TextStyle(
      color: Colors.white,
    ),
  ),
  action: SnackBarAction(
    textColor: Colors.white,
    label: 'ok',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);

final snackBarMissing = SnackBar(
  backgroundColor: Colors.red,
  content: const Text(
    'Error: Missing fields for email or password ',
    style: TextStyle(
      color: Colors.white,
    ),
  ),
  action: SnackBarAction(
    textColor: Colors.white,
    label: 'ok',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);
