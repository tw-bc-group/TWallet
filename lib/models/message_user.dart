class MessageUser {
  final String name;
  final String? lastMessage;
  final String? imageURL;
  final String? time;
  // unread message numebr, unread flag
  MessageUser({
    required this.name,
    this.lastMessage,
    // set default avatar image
    this.imageURL = 'https://picsum.photos/150',
    this.time,
  });
}

List chatData = [
  MessageUser(
    name: "Jane Russel",
    lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    time: "Now",
    imageURL: 'https://picsum.photos/150',
  ),
  MessageUser(
    name: "Glady's Murphy",
    lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    time: "Yesterday",
    imageURL: 'https://picsum.photos/150',
  ),
  MessageUser(
    name: "Jorge Henry",
    lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    time: "31 Mar",
    imageURL: 'https://picsum.photos/150',
  ),
  MessageUser(
    name: "Philip Fox",
    lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    time: "22 Mar",
    imageURL: 'https://picsum.photos/150',
  ),
];
