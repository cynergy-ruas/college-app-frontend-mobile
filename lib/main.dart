import 'package:college_app/screens/entry.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xff393e46),
      home: EntryPage(),
    );
  }
}
