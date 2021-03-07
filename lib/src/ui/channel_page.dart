import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/channel/channel_bloc.dart';
import 'package:frontend/src/model/channel.dart';
import 'package:frontend/src/ui/widgets/channels_view.dart';
import '../model/message.dart';

class ChannelPage extends StatefulWidget {
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  int fav = 8;
  int n = 6;
  ChannelBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = ChannelBloc();
    _loadChannels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff393e46),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 16, 0),
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
            BlocBuilder<ChannelBloc, ChannelState>(
              cubit: _bloc,
              builder: (BuildContext context, ChannelState state) {
                if (state is ChannelInitialState) {
                  return Center();
                } else if (state is ChannelLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ChannelLoadingError) {
                  return Center(
                    child: Column(
                      children: [
                        Text("Error loading channels."),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: _loadChannels,
                          child: Text("retry"),
                        )
                      ],
                    ),
                  );
                } else {
                  return Flexible(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: favourites(),
                            ),
                          ),
                        ),
                        DraggableScrollableSheet(
                          initialChildSize: 0.70,
                          minChildSize: 0.70,
                          maxChildSize: 0.98,
                          builder: (context, controller) => Container(
                            padding: EdgeInsets.only(top: 10),
                            decoration: ShapeDecoration(
                              color: Color(0xff222831),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                            ),
                            child: ChannelsView(
                                (state as ChannelLoadingComplete).data,
                                controller: controller),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
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

  void _loadChannels() {
    _bloc.add(LoadChannels());
  }

  String text(String a, String b) {
    String s = "";
    s = a + " : " + b;
    return s;
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}
