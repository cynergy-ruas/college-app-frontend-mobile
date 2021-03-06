import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor('#222831');
Color secondaryColor = HexColor('#F8F8F8');
Color tertiaryColor = HexColor('#1FFFFFFF');

class MessageScreen extends StatefulWidget {
  final String channel;
  MessageScreen(this.channel);
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    String message;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: width * 0.1),
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.13,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return MessageBubble(
                                      width:
                                          width, // Width should not be changed
                                      height:
                                          height, // Height should not be changed
                                      isMe:
                                          false, // isMe is true if sender is the same as current user, else false
                                      message: "Heya", // Must be updated by API
                                      sender:
                                          "Ujjwal", // Must be updated by API
                                      time: "3:15 a.m",
                                    ); // Must be updated by API
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.06),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                        child: Theme(
                          data: new ThemeData(
                            primaryColor: Colors.grey,
                            primaryColorDark: Colors.grey,
                          ),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white12,
                            decoration: InputDecoration(
                              prefixIcon: GestureDetector(
                                  onTap: () {
                                    // Display other options such as gallery etc
                                  },
                                  child: Icon(Icons.add, color: Colors.white)),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (message != null) {
                                      // Send Message Functionality
                                    }
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  )),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onChanged: (value) {
                              message = value;
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05,
                        top: height * 0.025,
                        bottom: height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                            size: height * 0.04,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.channel,
                              style: TextStyle(
                                  fontSize: height * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyanAccent),
                            ),
                            SizedBox(
                              height: height * 0.02,
                              width: width * 0.35,
                              child: Divider(
                                thickness: 8,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Container(
                          height: height * 0.07,
                          width: height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          // child: The Image
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.width,
    @required this.height,
    @required this.isMe,
    @required this.message,
    @required this.sender,
    @required this.time,
  }) : super(key: key);

  final double width;
  final double height;
  final bool isMe;
  final String message;
  final String sender;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMe
          ? EdgeInsets.only(right: width * 0.06, bottom: width * 0.015)
          : EdgeInsets.only(left: width * 0.06, bottom: width * 0.015),
      child: Container(
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.01, bottom: width * 0.01),
                  child: isMe
                      ? Container()
                      : Text(
                          sender,
                          style: TextStyle(
                              fontSize: height * 0.02,
                              color: Colors.tealAccent),
                        ),
                ),
              ],
            ),
            Container(
              width: width * 0.65,
              decoration: BoxDecoration(
                  borderRadius: isMe
                      ? BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                  color: isMe ? primaryColor : secondaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.025),
                    child: Text(
                      message,
                      style: TextStyle(
                          fontSize: height * 0.02,
                          color: isMe ? secondaryColor : Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: width * 0.045, bottom: width * 0.015),
                        child: Text(
                          time,
                          style: TextStyle(
                              fontSize: height * 0.014, color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
