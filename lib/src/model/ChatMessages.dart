import 'dart:convert';

class Messages {
  final int time;
  final String sender, message;

  Messages({
    this.time,
    this.sender,
    this.message
  });

  factory Messages.fromJson(Map<String, dynamic> jsonData) {
    return Messages(
      time: jsonData['time'],
      sender: jsonData['sender'],
      message: jsonData['message'],
    );
  }

  static Map<String, dynamic> toMap(Messages messages) => {
    'time': messages.time,
    'sender': messages.sender,
    'message': messages.message,
  };

  static String encode(List<Messages> messages) => json.encode(
    messages
        .map<Map<String, dynamic>>((messages) => Messages.toMap(messages))
        .toList(),
  );

  static List<Messages> decode(String messages) =>
      (json.decode(messages) as List<dynamic>)
          .map<Messages>((item) => Messages.fromJson(item))
          .toList();
}