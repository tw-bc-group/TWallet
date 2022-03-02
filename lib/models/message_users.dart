class MessageUsers {
  final String name;
  final String? lastMessage;
  final String? imageURL;
  final String? time;
  MessageUsers(
      {required this.name, this.lastMessage, this.imageURL, this.time});
}

List chatData = [
  MessageUsers(name: "Jane Russel", time: "Now"),
  MessageUsers(name: "Glady's Murphy", time: "Yesterday"),
  MessageUsers(name: "Jorge Henry", time: "31 Mar"),
  MessageUsers(name: "Philip Fox", time: "28 Mar"),
];
