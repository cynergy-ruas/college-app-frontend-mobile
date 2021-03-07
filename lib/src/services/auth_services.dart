import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/src/model/token.dart';
import 'package:frontend/src/services/firebase_services.dart';
import 'package:http/http.dart' as http;

FirebaseService firebaseService;
Token t;
Uri url = Uri.parse("174.138.123.152:8080/auth/register");

Future<String> register(String registrationNumber, String password) async {
  String body =
      json.encode({"reg_no": registrationNumber, "password": password});
  var res = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (res.statusCode != 200) {
    return "error";
  }
  var data = jsonDecode(res.body);
  t = data["token"];
  print(t);
  firebaseService.signInWithCustomToken(t);
  return t.toString();
}

Uri url1 = Uri.parse("174.138.123.152:8080/auth/login");

Future<String> login(String registrationNumber, String password) async {
  String body =
      json.encode({"reg_no": registrationNumber, "password": password});
  var res = await http.post(url1,
      headers: {"Content-Type": "application/json"}, body: body);
  if (res.statusCode != 200) {
    return "error";
  }
  var data = jsonDecode(res.body);
  t = data["token"];
  print(t);
  firebaseService.signInWithCustomToken(t);
  return t.toString();
}
