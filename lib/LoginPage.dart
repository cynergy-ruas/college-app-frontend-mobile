import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

String serverResponse = 'Server response';
FirebaseAuth _auth = FirebaseAuth.instance;
final String url = "https://roohas-test.herokuapp.com/"; //test link to server

class LoginPages extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {

  String regNo = "";
  String pin = "";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Registration or Roll number",
              ),
              onChanged: (value) {
                regNo = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Pin",
              ),
              onChanged: (value) {
                pin = value;
              },
            ),
            FlatButton(
                child: Text(
                    'Login'
                ),
                onPressed: () {
                  setState(() {
                    createReg(regNo, pin, 'login'); //function that will dead with login/signup
                  });
                }),
            FlatButton(
                child: Text(
                    'Register'
                ),
                onPressed: () {
                  setState(() {
                    createReg(regNo, pin, 'signup'); //function that will dead with login/signup
                  });
                })
          ],
        ),
      ),
    );
  }
}
createReg(String RegNo, String Pin, String type) async {
  final http.Response response = await http.post(
    "$url$type",
    headers:{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'roll': RegNo,
      'password' : Pin,
    }),
  );
  var token = jsonDecode(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 SUCCESS response,
    if (token['token'] != null) {  // asserting null vaule has not been received
      try {
        _auth.signInWithCustomToken(token['token']);
      } catch (e) {
        throw Exception(e);
      }
    }
  } else {
    // If the server did not return a 200 SUCCESS response,
    // then throw an exception.
    throw Exception('Failed to load details');
  }
}

