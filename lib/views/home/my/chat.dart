import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:uuid/uuid.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:flutter_svg/svg.dart';

// For header
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

enum BackIcon { none, arrow }

class ChatPage extends StatefulWidget {
  final String username;
  final String roomId;
  final String userId;

  const ChatPage({
    this.username = 'Test user',
    required this.roomId,
    required this.userId,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _handleSendPressed(types.PartialText message) {
    print('_handleSendPressed');
    FirebaseChatCore.instance.sendMessage(
      message,
      widget.roomId,
    );
  }

  void _loadMessages() async {
    final response =
        await rootBundle.loadString('assets/dummy_data/chat_data.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('room id');
    print(widget.roomId);
    // print(FirebaseChatCore.instance.room(widget.roomId));
    return CommonLayout(
      customTitle: ChatTitleBar(user: widget.username, phone: '23456789'),
      bottomBackColor: WalletColor.white,
      child: Scaffold(
        body: StreamBuilder<types.Room>(
          // initialData: null,
          // initialData: widget.room,
          stream: FirebaseChatCore.instance.room(widget.roomId),
          builder: (context, snapshot) {
            print(snapshot.data);
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
        // SafeArea(
        //   bottom: false,
        //   child: Chat(
        //     theme: DarkChatTheme(
        //       inputBackgroundColor: WalletColor.white,
        //       inputTextColor: WalletColor.black,
        //       primaryColor: WalletColor.primary,
        //     ),
        //     messages: _messages,
        //     onSendPressed: _handleSendPressed,
        //     user: _user,
        //     showUserAvatars: true,
        //   ),
        // ),
      ),
    );
  }
}

class ChatTitleBar extends StatelessWidget {
  final String user;
  final String? avatorUrl;
  final String phone;
  final BackIcon backIcon;
  final BeforeDispose? beforeDispose;

  const ChatTitleBar({
    required this.user,
    this.avatorUrl,
    this.phone = '',
    this.backIcon = BackIcon.arrow,
    this.beforeDispose,
  });

  @override
  Widget build(BuildContext context) {
    final _whiteColor = TextStyle(color: WalletColor.white);

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
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://picsum.photos/150'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.user,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: WalletColor.white,
                      ),
                    ),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        this.phone,
                        style: TextStyle(
                          fontSize: 13,
                          color: WalletColor.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
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
