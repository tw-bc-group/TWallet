import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/models/message_users.dart';

class MessagePage extends StatefulWidget {
  const MessagePage();

  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<MessageUsers> chatUsers = [
    MessageUsers(name: "Jane Russel", time: "Now"),
    MessageUsers(name: "Glady's Murphy", time: "Yesterday"),
    MessageUsers(name: "Jorge Henry", time: "31 Mar"),
    MessageUsers(name: "Philip Fox", time: "28 Mar"),
  ];

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: "Message",
      child: Column(
        children: [_buildMessageEmpty(context)],
      ),
    );
  }

  Widget _buildMessageEmpty(BuildContext context) {
    return const Text("Empty message");
  }
}
