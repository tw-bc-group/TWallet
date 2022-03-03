class MessageUser {
  final String name;
  final String? lastMessage;
  final String? imageURL;
  final String? time;
  MessageUser({required this.name, this.lastMessage, this.imageURL, this.time});
}

List chatData = [
  MessageUser(
    name: "Jane Russel",
    lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    time: "Now",
    imageURL: 'assets/images/edit.png',
  ),
  MessageUser(
    name: "Glady's Murphy",
    lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    time: "Yesterday",
    imageURL: 'assets/images/edit.png',
  ),
  MessageUser(
    name: "Jorge Henry",
    lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    time: "31 Mar",
    imageURL: 'assets/images/edit.png',
  ),
  MessageUser(
    name: "Philip Fox",
    lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    time: "22 Mar",
    imageURL: 'assets/images/edit.png',
  ),
];
