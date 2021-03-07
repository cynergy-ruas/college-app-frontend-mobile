import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:frontend/src/consts/HomePage_Icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Color color = Colors.blueAccent;
String Setter;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: color,
          items: [
            Icon(HomeIcons.calendar_alt),
            Icon(HomeIcons.pen_alt),
            Icon(HomeIcons.home_outline),
            Icon(HomeIcons.rocketchat),
            Icon(HomeIcons.user)
          ],
          onTap: (index) {
            setState(() {
              if (index == 0) {
                color = Colors.blueGrey;
                // TODO Calender Page
              } else if (index == 1) {
                // TODO Notes Page
                color = Colors.blueGrey;
              } else if (index == 2) {
                // TODO Home Page
                color = Colors.blueGrey;
              } else if (index == 3) {
                // TODO Chat Page
                color = Colors.blueGrey;
              } else {
                // TODO Profile Page
                color = Colors.blueGrey;
              }
            });
          }),
    );
  }
}
