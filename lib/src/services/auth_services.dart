import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = "174.138.121.47:8080";

Future<String> register(String registrationNumber, String password) async {
  String body =
      json.encode({"reg_no": registrationNumber, "password": password});
  var res = await http.post(url + "/register",
      headers: {"Content-Type": "application/json"}, body: body);
  if (res.statusCode != 200) {
    return "error";
  }
  return res.body;
}
