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
