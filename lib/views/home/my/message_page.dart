import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/models/message_users.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      bottomBackColor: WalletColor.messageBg,
      appBarActions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {})
      ],
      child: Column(
        children: [_buildMessageEmpty(context)],
      ),
    );
  }

  Widget _buildMessageEmpty(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: WalletColor.messageBg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/new-identity.svg',
            ),
            Column(
              children: <Widget>[
                Text(
                  "暂无聊天信息",
                  style: TextStyle(
                    color: WalletColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  "请前往添加新聊天",
                  style: TextStyle(
                    color: WalletColor.lightGrey,
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            color: WalletColor.messageBg,
          ),
          child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) => Row(
                    children: [Text('Test')],
                  ))),
    );
  }
}
