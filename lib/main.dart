import 'package:college_app/screens/entry.dart';
import 'package:flutter/material.dart';
import 'Screens/Registeration_screen 1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(primaryColor: Color(0xFF03AFB7)),
      debugShowCheckedModeBanner: false,
      home: Material(
        child: RegisterationPage(),
      ),
    );
  }
}
