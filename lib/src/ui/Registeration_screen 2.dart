import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pin_setup.dart';

class PinSetup extends StatefulWidget {
  final String text;
  PinSetup(this.text);

  @override
  _PinSetupState createState() => _PinSetupState();
}

class _PinSetupState extends State<PinSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xff393E46),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Almost Done',
                  style: TextStyle(
                      color: Color(0xFFFA947E),
                      fontSize: 20.0,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 20),
                Container(
                  height: 164,
                  width: 192,
                  decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Let’s Quickly Setup a Pin',
                  style: TextStyle(
                      color: Color(0xFFFA947E),
                      fontSize: 15.0,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 20),
                Container(
                  width: 270,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF4E5561),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                SizedBox(height: 20),
                IconButton(
                    color: Colors.white,
                    icon: Icon(
                      CupertinoIcons.arrow_right_circle,
                      size: 30.0,
                    ),
                    onPressed: () {
                      print(widget.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PinPage(widget.text)),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
