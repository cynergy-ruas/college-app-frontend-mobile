import 'package:frontend/Screens/chat_main.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  String user;
  Login(this.user);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String finalPin = "1234";
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Color(0xfffa947e),
                          fontSize: 18.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.28,
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
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.25, 0, 0),
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
                        widget.user,
                        style: TextStyle(
                          color: Color(0xfffa947e),
                          fontSize: 16.0,
                          fontFamily: 'Lato',
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
          printPinField(),
          keypad(),
        ],
      ),
    );
  }

  Widget keypad() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Container(
          child: Column(
            children: <Widget>[
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _pinKeyboardInputButton(
                        label: "1",
                        onPressed: () {
                          _setCurrentDigit(1);
                        }),
                    _pinKeyboardInputButton(
                        label: "2",
                        onPressed: () {
                          _setCurrentDigit(2);
                        }),
                    _pinKeyboardInputButton(
                        label: "3",
                        onPressed: () {
                          _setCurrentDigit(3);
                        }),
                  ],
                ),
              ),
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _pinKeyboardInputButton(
                        label: "4",
                        onPressed: () {
                          _setCurrentDigit(4);
                        }),
                    _pinKeyboardInputButton(
                        label: "5",
                        onPressed: () {
                          _setCurrentDigit(5);
                        }),
                    _pinKeyboardInputButton(
                        label: "6",
                        onPressed: () {
                          _setCurrentDigit(6);
                        }),
                  ],
                ),
              ),
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _pinKeyboardInputButton(
                        label: "7",
                        onPressed: () {
                          _setCurrentDigit(7);
                        }),
                    _pinKeyboardInputButton(
                        label: "8",
                        onPressed: () {
                          _setCurrentDigit(8);
                        }),
                    _pinKeyboardInputButton(
                        label: "9",
                        onPressed: () {
                          _setCurrentDigit(9);
                        }),
                  ],
                ),
              ),
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _pinKeyboardActionButton(
                      label: Image.asset("assets/images/verified copy.png"),
                      onPressed: () {},
                    ),
                    _pinKeyboardInputButton(
                        label: "0",
                        onPressed: () {
                          _setCurrentDigit(0);
                        }),
                    _pinKeyboardActionButton(
                        label: new Icon(
                          Icons.backspace,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_fourthDigit != null) {
                              _fourthDigit = null;
                            } else if (_thirdDigit != null) {
                              _thirdDigit = null;
                            } else if (_secondDigit != null) {
                              _secondDigit = null;
                            } else if (_firstDigit != null) {
                              _firstDigit = null;
                            }
                          });
                        }),
                  ],
                ),
              ),
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
      ),
    );
  }

  Widget pinField(int digit) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: new Text(
            digit != null ? digit.toString() : "",
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
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
      ],
    );
  }

  Widget printPinField() {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pinField(_firstDigit),
            pinField(_secondDigit),
            pinField(_thirdDigit),
            pinField(_fourthDigit),
          ],
        ),
      ),
    );
  }

  void _setCurrentDigit(int i) {
    setState(() {
      _currentDigit = i;
      if (_firstDigit == null) {
        _firstDigit = _currentDigit;
      } else if (_secondDigit == null) {
        _secondDigit = _currentDigit;
      } else if (_thirdDigit == null) {
        _thirdDigit = _currentDigit;
      } else if (_fourthDigit == null) {
        _fourthDigit = _currentDigit;

        var pin = _firstDigit.toString() +
            _secondDigit.toString() +
            _thirdDigit.toString() +
            _fourthDigit.toString();

        if (pin == finalPin) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainChat(),
            ),
          );
        }
      }
    });
  }

  void clearPin() {
    _fourthDigit = null;
    _thirdDigit = null;
    _secondDigit = null;
    _firstDigit = null;
    setState(() {});
  }

  Widget _pinKeyboardInputButton({String label, VoidCallback onPressed}) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: onPressed,
        borderRadius: new BorderRadius.circular(40.0),
        child: new Container(
          height: 80.0,
          width: 80.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: new Center(
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _pinKeyboardActionButton({Widget label, VoidCallback onPressed}) {
    return new InkWell(
      onTap: onPressed,
      borderRadius: new BorderRadius.circular(40.0),
      child: new Container(
        height: 80.0,
        width: 80.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: new Center(
          child: label,
        ),
      ),
    );
  }
}
