import 'package:flutter/material.dart';
import 'package:frontend/src/model/channel.dart';

class ChannelsView extends StatelessWidget {
  final List<Channel> channels;
  final ScrollController controller;

  ChannelsView(this.channels, {this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: channels.length,
      controller: this.controller,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ChannelTile(channels[index]);
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10,
      ),
    );
  }
}

class ChannelTile extends StatelessWidget {
  final Channel channel;

  ChannelTile(this.channel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xffc4c4c4),
      ),
      title: Text(
        channel.name,
        style: TextStyle(
          fontFamily: "Lato",
          color: Color(0xfffa947e),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        channel.description,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 15,
          color: Color(0xffeeeeee),
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 100,
      ),
    );
  }
}
