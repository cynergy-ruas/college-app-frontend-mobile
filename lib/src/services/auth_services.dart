import 'dart:convert';

import 'package:frontend/src/model/channel.dart';
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
  print(res.body);
  return res.body;
}

Future<String> user(String registrationNumber, String name, String department,
    int semester, String section, String email) async {
  String body = json.encode({
    "reg_no": registrationNumber,
    "name": name,
    "department": department,
    "semester": semester,
    "section": section,
    "email": email
  });
  var res = await http.post(url + "/user/create",
      headers: {"Content-Type": "application/json"}, body: body);
  if (res.statusCode != 200) {
    return "error";
  }
  print(res.body);
  return res.body;
}

List<Channel> ch_all = [];
Future<List<Channel>> loadData() async {
  var response = await http.get(url + "/channel/all");

  print(response.body);
  List<dynamic> data = jsonDecode(response.body);

  for (int i = 0; i < data.length; i++) {
    ch_all.add(
      Channel(
          id: data[i]["_id"],
          name: data[i]["name"],
          members: data[i]["members"],
          type: data[i]["type"],
          dp: data[i]["dp"],
          admins: data[i]["admins"]),
    );
  }
  print(response.body);

  return ch_all;
}
