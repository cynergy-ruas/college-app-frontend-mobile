class Message {
  final String channel;
  final String sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.channel,
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    channel: 'Avengers',
    sender: 'Iron Man',
    time: '5:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    channel: 'Cynergy ',
    sender: 'Shikhar',
    time: '7:50 PM',
    text: 'Hey guys! We\'re on to V0! Let\'s go !!',
    unread: true,
  ),
  Message(
    channel: 'Harry Potter',
    sender: 'Hermione',
    time: '10:00 AM',
    text: 'Its Levi-O-sa, not Leviosaaa',
    unread: true,
  ),
];
