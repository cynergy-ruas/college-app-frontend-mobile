import 'package:flutter/material.dart';
import 'package:frontend/src/model/channel.dart';
import 'package:frontend/src/ui/MessageScreen.dart';
import '../services/auth_services.dart';

class MainChat extends StatefulWidget {
  final Function goto;

  const MainChat({Key key, this.goto}) : super(key: key);

  @override
  _MainChatState createState() => _MainChatState();
}

class _MainChatState extends State<MainChat> {
  int fav = 8;
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
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
        itemCount: ch_all.length,
        itemBuilder: (BuildContext context, int index) {
          final Channel chat = ch_all[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(_createRoute(chat.name));
            },
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
                                  chat.name,
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
                              chat.type,
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
                                text(chat.type, chat.dp),
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

  Route _createRoute(String c) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MessageScreen(c),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
