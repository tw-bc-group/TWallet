import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/message_user.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class MessagePage extends StatefulWidget {
  const MessagePage();

  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: "Message",
      bottomBackColor: WalletColor.messageBg,
      appBarActions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {})
      ],
      floatingBtn: FloatingActionButton(
        backgroundColor: WalletColor.red,
        child: const Icon(Icons.person_add_alt_1),
        onPressed: () {},
      ),
      child: Column(
        children: [
          if (chatData.isEmpty)
            _buildMessageEmpty(context)
          else
            _buildMessageList(context)
        ],
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
          itemBuilder: (context, index) =>
              charCard(chat: chatData[index] as MessageUser, press: () {}),
        ),
      ),
    );
  }
}

class charCard extends StatelessWidget {
  const charCard({Key? key, required this.chat, required this.press})
      : super(key: key);

  final MessageUser chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: WalletColor.messageBg,
      child: InkWell(
        onTap: press,
        hoverColor: WalletColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/edit.png'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: WalletColor.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Opacity(
                        opacity: 0.64,
                        child: Text(
                          chat.lastMessage.toString(),
                          style: TextStyle(color: WalletColor.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: 0.64,
                child: Text(
                  chat.time.toString(),
                  style: TextStyle(color: WalletColor.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
