import 'package:meta/meta.dart';

class Channel {
  final String id;
  final String name;
  final String description;
  final List<String> members;
  final String type;
  final String dp;
  final List<String> admins;
  final String owner;

  Channel({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.members,
    @required this.type,
    @required this.admins,
    @required this.owner,
    this.dp,
  });

  factory Channel.fromJson(Map<String, dynamic> data) {
    return Channel(
      id: data["id"],
      name: data["name"],
      description: data["description"],
      members: data["members"],
      type: data["type"],
      admins: data["admins"],
      owner: data["owner"],
      dp: data["dp"],
    );
  }
}

// example channels
List<Channel> exampleChannels = [
  Channel.fromJson({
    "id": "3248fhj832fhds9",
    "name": "Avengers",
    "description": "Iron man 3000",
    "members": ["2819gufdx43289", "94rkjla47ghow9"],
    "type": "public",
    "admins": ["2819gufdx43289"],
    "owner": "2819gufdx43289"
  }),
  Channel.fromJson({
    "id": "3248fhj832fhds9",
    "name": "Cynergy",
    "description": "Coding club",
    "members": ["2819gufdx43289", "94rkjla47ghow9"],
    "type": "public",
    "admins": ["2819gufdx43289"],
    "owner": "2819gufdx43289"
  }),
  Channel.fromJson({
    "id": "3248fhj832fhds9",
    "name": "Harry Potter",
    "description": "and the half blood prince",
    "members": ["2819gufdx43289", "94rkjla47ghow9"],
    "type": "public",
    "admins": ["2819gufdx43289"],
    "owner": "2819gufdx43289"
  })
];
