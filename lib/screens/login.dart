import 'package:college_app/screens/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _currentDigit;
  int _firstDigit;
  int _secondDigit;
  int _thirdDigit;
  int _fourthDigit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff393e46),
      body: Column(
        // The top rectangle with the app name
        children: [
          Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "App Name",
                        style: TextStyle(
                          color: Color(0xfffa947e),
                          fontSize: 30.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Color(0xfffa947e),
                        fontSize: 18.0,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                decoration: ShapeDecoration(
                  color: Color(0xff222831),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                ),
              ),
              // The container with the user's name on it and image
              Container(
                alignment: Alignment.topCenter,
                padding:
                    new EdgeInsets.only(top: 220.0, right: 20.0, left: 20.0),
                child: new Container(
                  height: 58,
                  width: 313.0,
                  decoration: ShapeDecoration(
                    color: Color(0xff394352),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffc4c4c4),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Color(0xfffa947e),
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // The login pin
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Login Pin",
              style: TextStyle(
                color: Color(0xfffa947e),
                fontSize: 20.0,
              ),
            ),
          ),
          //The containers to input login pin
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                decoration: ShapeDecoration(
                  color: Color(0xff6a6a6a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                decoration: ShapeDecoration(
                  color: Color(0xff6a6a6a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                decoration: ShapeDecoration(
                  color: Color(0xff6a6a6a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                decoration: ShapeDecoration(
                  color: Color(0xff6a6a6a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          //The keypad to input the login pin
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //First row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "1",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        shape: CircleBorder(),
                        child: Text(
                          "2",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "3",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                    ],
                  ),
                  //Second row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "4",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "5",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "6",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                    ],
                  ),
                  //Third row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "7",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "8",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "9",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                    ],
                  ),
                  //Fourth row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Image.asset('assets/images/verified copy.png'),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "0",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Otp(),
                            ),
                          );
                        },
                        child:
                            Image.asset("assets/images/circle-arrow-right.png"),
                      ),
                    ],
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: ShapeDecoration(
                color: Color(0xff222831),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
