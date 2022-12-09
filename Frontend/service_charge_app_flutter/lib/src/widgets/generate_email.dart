import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class SendEmailD extends StatefulWidget {
  const SendEmailD({super.key});

  @override
  State<SendEmailD> createState() => _SendEmailDState();
}

final name = TextEditingController();
final email = TextEditingController();
final subject = TextEditingController();
final message = TextEditingController();

class _SendEmailDState extends State<SendEmailD> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blue, elevation: 10),
        onPressed: () => _dialogBuilder(context),
        child: const Text("Send Email", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Future sendEmail({
    required name,
    required email,
    required subject,
    required message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_o95ab5r';
    const templateId = 'template_618w9mo';
    const userId = 'qh64EH-x6hJrK6NDN';

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          },
        }));
    print(response.body);
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 450, vertical: 45),
          title: const Text(
            'Send an Email',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Card(
            elevation: 5,
            color: Colors.grey.shade200,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 270, 0),
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 270, 0),
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 263, 0),
                child: Text(
                  "Subject",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: subject,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 255, 0),
                child: Text(
                  "Message",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    maxLines: 5,
                    controller: message,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
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
                    sendEmail(
                        email: email.text,
                        message: message.text,
                        name: name.text,
                        subject: subject.text,
                      );
                      Navigator.of(context).pop();
                      email.clear();
                      message.clear();
                      name.clear();
                      subject.clear();
                  },
                  child: const Text("Send"),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}