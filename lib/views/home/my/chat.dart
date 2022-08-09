import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

enum BackIcon { none, arrow }

class ChatPage extends StatefulWidget {
  final types.Room room;
  final types.User? user;

  const ChatPage({
    required this.room,
    this.user,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleSendPressed(types.PartialText message) async {
    FirebaseChatCore.instance.sendMessage(
      message,
      widget.room.id,
    );
    final Map<String, dynamic> messageMap = message.toJson();
    messageMap['updatedAt'] = FieldValue.serverTimestamp();
    FirebaseChatCore.instance
        .getFirebaseFirestore()
        .collection('rooms')
        .doc(widget.room.id)
        .set(messageMap, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    print('===ROOM===');
    print(widget.room);
    return CommonLayout(
      customTitle: ChatTitleBar(
        userName: widget.room.name ?? widget.user!.firstName ?? '',
        avatorUrl: widget.room.imageUrl ??
            'https://i.picsum.photos/id/1/200/300.jpg?hmac=jH5bDkLr6Tgy3oAg5khKCHeunZMHq0ehBZr6vGifPLY',
      ),
      bottomBackColor: WalletColor.white,
      child: Scaffold(
        body: StreamBuilder<types.Room>(
          initialData: widget.room,
          stream: FirebaseChatCore.instance.room(widget.room.id),
          builder: (context, snapshot) {
            return StreamBuilder<List<types.Message>>(
              initialData: const [],
              stream: FirebaseChatCore.instance.messages(snapshot.data!),
              builder: (context, snapshot) {
                return SafeArea(
                  bottom: false,
                  child: Chat(
                    theme: DarkChatTheme(
                      inputBackgroundColor: WalletColor.white,
                      inputTextColor: WalletColor.black,
                      primaryColor: WalletColor.primary,
                    ),
                    messages: snapshot.data ?? [],
                    onSendPressed: _handleSendPressed,
                    user: types.User(
                      id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ChatTitleBar extends StatelessWidget {
  final String userName;
  final String avatorUrl;
  final String? phone;
  final BackIcon backIcon;
  final BeforeDispose? beforeDispose;

  const ChatTitleBar({
    required this.userName,
    required this.avatorUrl,
    this.phone = '',
    this.backIcon = BackIcon.arrow,
    this.beforeDispose,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (backIcon != BackIcon.none)
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/back-arrow.svg',
                  // color: WalletColor.white
                ),
                iconSize: 30,
                color: WalletColor.white,
                onPressed: () async {
                  if (null != beforeDispose) {
                    await beforeDispose!();
                  }
                  Application.router.pop(context);
                },
              ),
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(avatorUrl),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: WalletColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
