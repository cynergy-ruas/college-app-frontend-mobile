import 'package:flutter/material.dart';
import '../model/message.dart';

class MainChat extends StatefulWidget {
  @override
  _MainChatState createState() => _MainChatState();
}

class _MainChatState extends State<MainChat> {
  int fav = 8;
  int n = 6;
  String title = 'Channel name';
  String lastmessage = 'Last message';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff393e46),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 16, 16),
              child: Text(
                "Channels",
                style: TextStyle(
                  color: Color(0xff00f4ff),
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: favourites(),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: ShapeDecoration(
                  color: Color(0xff222831),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                ),
                child: channels(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> favourites() {
    List<Widget> top = [];
    for (int i = 1; i <= fav; i++) {
      top.add(
        CircleAvatar(
          backgroundColor: Color(0xffc4c4c4),
          radius: 40.0,
        ),
      );
      top.add(
        SizedBox(
          width: 20.0,
        ),
      );
    }

    return top;
  }

  Widget channels(context) {
    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffc4c4c4),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  chat.channel,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Color(0xfffa947e),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              chat.time,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Color(0xffeeeeee),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                text(chat.sender, chat.text),
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  color: Color(0xffeeeeee),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 100,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  String text(String a, String b) {
    String s = "";
    s = a + " : " + b;
    return s;
  }
}
