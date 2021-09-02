import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/Model/ChatMessages.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Color PrimaryColor = HexColor('#222831');
Color SecondaryColor = HexColor('#F8F8F8');
Color TertiaryColor = HexColor('#1FFFFFFF');

const SERVER_IP = '174.138.123.152';
const CHANNEL_ID = 'Yolo';
const SENDER_ID = 'Ujjwal Sumesh';
const SERVER_PORT = '8080';
const URL = "ws://$SERVER_IP:$SERVER_PORT/message/ws/$CHANNEL_ID/$SENDER_ID";
final WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(URL));
var data;
bool messageReady = false;
Map<String, dynamic> keys;
List<String> senders = [];
List<String> messages = [];
List<String> times = [];

// SharedPreferences prefs;
List databaseMessages;

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String message;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        //resizeToAvoidBottomInset: true,
        backgroundColor: PrimaryColor,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: height,
              ),
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
                        child: StreamBuild(
                          height: height,
                          width: width,
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
                            cursorColor: Colors.white12,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                    onTap: () {
                                      // Display other options such as gallery etc
                                    },
                                    child:
                                        Icon(Icons.add, color: Colors.white)),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.send),
                                  color: Colors.white,
                                  onPressed: () {
                                    print(message);
                                    sendMessage(message);
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            onChanged: (value) {
                              setState(() {
                                message = value;
                              });
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
                        top: height * 0.05,
                        bottom: height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                          size: height * 0.04,
                        ),
                        SizedBox(
                          width: width * 0.3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              CHANNEL_ID,
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

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
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
                  color: isMe ? PrimaryColor : SecondaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.025),
                    child: Text(
                      message,
                      style: TextStyle(
                          fontSize: height * 0.02,
                          color: isMe ? SecondaryColor : Colors.black),
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

class StreamBuild extends StatelessWidget {
  StreamBuild({
    @required this.height,
    @required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 0.13,
        ),
        StreamBuilder<Object>(
            stream: channel.stream,
            builder: (context, snapshot) {
              data = snapshot.data;
              if (data == null) {
                return Container(
                  child: CircularProgressIndicator(),
                );
              } else {
                print(data);
                keys = jsonDecode(data);
                print(keys);
                if (!messages.contains(keys["message"])) {
                  senders.add(keys["sender_id"]);
                  messages.add(keys["message"]);
                }
                databaseMessages.add(keys);
                print(senders);
                print(messages);
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: senders.length,
                      itemBuilder: (context, index) {
                        return MessageBubble(
                            width: width,
                            height: height,
                            isMe: false,
                            // isMe is true if sender is the same as current user, else false
                            message: messages[index],
                            // Must be updated by API
                            sender: senders[index],
                            // Must be updated by API
                            time: "something"); // MuRst be updated by API
                      }),
                );
              }
            })
      ],
    );
  }
}

sendMessage(message) async {
  if (message == null && !messages.contains(message))
    channel.sink.add(jsonEncode({
      'channel_id': CHANNEL_ID,
      'message': 'heya there',
      'sender_id': SENDER_ID,
      'timestamp': DateTime.now().minute
    }));

  prefs.setString(
      'messages', Messages.encode(Messages.toMap(databaseMessages)));
}

getData() async {
  prefs = await SharedPreferences.getInstance();
  databaseMessages = Messages.decode(prefs.getString('messages'));
}
