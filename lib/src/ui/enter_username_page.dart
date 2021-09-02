import 'package:flutter/material.dart';

class EnterUserName extends StatefulWidget {
  final Function goto;
  final Function setUser;

  const EnterUserName({Key key, this.goto, this.setUser}) : super(key: key);
  @override
  _EnterUserNameState createState() => _EnterUserNameState();
}

class _EnterUserNameState extends State<EnterUserName> {
  // String user = "";
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff393e46),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
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
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              border: Border.all(),
              color: Color(0xffc4c4c4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text("App Logo/ Animation?"),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: myController,
              cursorColor: Color(0xffc4c4c4),
              style: TextStyle(
                color: Color(0xffc4c4c4),
                fontSize: 15.0,
              ),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color(0xffc4c4c4),
                ),
                hintText: 'Enter your user name',
                hintStyle: TextStyle(
                  color: Color(0xffc4c4c4),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffc4c4c4),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffc4c4c4),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_outlined),
        backgroundColor: Colors.transparent,
        onPressed: () {
          confirm();
        },
      ),
    );
  }

  void confirm() {
    print(myController.text);
    FocusScope.of(context).unfocus();
    widget.setUser(myController.text);
    widget.goto(1);
  }

  Widget showDialogBox() {
    return AlertDialog(
      title: Text(
        "Enter the right username.",
        style: TextStyle(
          color: Color(0xfffa947e),
          fontSize: 20.0,
          fontFamily: 'Lato',
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "OK",
            style: TextStyle(
              color: Color(0xfffc4c4c4),
              fontSize: 16.0,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ],
      backgroundColor: Color(0xff4E5561),
    );
  }
}
