import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final Function goto;

  const LandingPage({Key key, this.goto}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff393e46),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Color(0xffc4c4c4),
              child: Text(
                "App logo",
                style: TextStyle(color: Colors.black),
              ),
              radius: 75.0,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                color: Color(0xff4E5561),
                onPressed: () {
                  widget.goto(0);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Color(0xfffa947e),
                      fontSize: 16.0,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0))),
                color: Color(0xff4E5561),
                onPressed: () {
                  widget.goto(2);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xfffa947e),
                      fontSize: 16.0,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
