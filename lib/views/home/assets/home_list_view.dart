import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class HomeListView extends StatelessWidget {
  final RefreshCallback onRefresh;
  final List<Widget> children;

  const HomeListView({this.onRefresh, @required this.children});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: WalletColor.primary,
      onRefresh: onRefresh,
      child: Container(
        color: WalletColor.backgroundWhite,
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: ListView(
          children: children,
        ),
      ),
    );
  }
}
