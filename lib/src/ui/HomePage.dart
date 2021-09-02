import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:frontend/src/consts/HomePage_Icons.dart';
import 'package:frontend/src/ui/channel_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Color color = Colors.blueAccent;

class _HomePageState extends State<HomePage> {
  Widget body;

  @override
  void initState() {
    super.initState();

    body = Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: body,
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOutQuart,
        animationDuration: Duration(milliseconds: 300),
        height: 50,
        backgroundColor: color,
        items: [
          Icon(HomeIcons.calendar_alt),
          Icon(HomeIcons.pen_alt),
          Icon(HomeIcons.home_outline),
          Icon(HomeIcons.rocketchat),
          Icon(HomeIcons.user)
        ],
        onTap: (index) {
          setState(
            () {
              if (index == 0) {
                body = Container(); // TODO Calender Page
                color = Colors.blueGrey;
              } else if (index == 1) {
                body = Container(); // TODO Notes Page
                color = Colors.blueGrey;
              } else if (index == 2) {
                body = Container(); // TODO Home Page
                color = Colors.blueGrey;
              } else if (index == 3) {
                body = ChannelPage();
                color = Color(0xff222831);
              } else {
                body = Container(); // TODO Profile Page
                color = Colors.blueGrey;
              }
            },
          );
        },
      ),
    );
  }
}
