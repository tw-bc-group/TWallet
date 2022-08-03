import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';

import 'home_list_item.dart';
import 'home_list_view.dart';

Widget _pointItem({required String point, required BuildContext context}) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, Routes.txList),
    child: HomeListItem(
      leading: Text(
        Application.globalEnv.tokenName,
        style: const TextStyle(
          fontFamily: 'OpenSans',
          color: Color(0xff111111),
          fontSize: 16,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.normal,
          letterSpacing: 0,
        ),
      ),
      trailing: Text(
        point,
        style: const TextStyle(
          fontFamily: 'PingFangSC',
          color: Color(0xff4200d4),
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: 0,
        ),
      ),
    ),
  );
}

class PointTab extends StatefulWidget {
  @override
  _PointTabState createState() => _PointTabState();
}

class _PointTabState extends State<PointTab> {
  final IdentityStore _identityStore = Get.find();

  ReactionDisposer? reactionDispose;

  Future<void> _refresh() async {
    _identityStore.fetchLatestPoint();
  }

  @override
  void dispose() {
    super.dispose();
    reactionDispose!();
  }

  @override
  void initState() {
    super.initState();
    reactionDispose = reaction(
      (_) => _identityStore.selectedIdentity!.value.id,
      (_) => _refresh(),
    );
    _identityStore.fetchLatestPoint(withLoading: false);
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) {
          Optional<Amount> amount;
          final ObservableFuture<TwBalance> future =
              _identityStore.fetchBalanceFutureStream!.value!;

          switch (future.status) {
            case FutureStatus.fulfilled:
              amount = Optional.ofNullable(future.result as TwBalance)
                  .map((balance) => balance.amount);
              break;
            case FutureStatus.pending:
              amount = const Optional.empty();
              break;
            default:
              amount = _identityStore.selectedIdentity!
                  .map((i) => i.accountInfo.balance!);
              break;
          }

          return HomeListView(
            onRefresh: _refresh,
            children: [
              _pointItem(
                point:
                    amount.map((a) => a.humanReadableWithSymbol).orElse('--'),
                context: context,
              )
            ],
          );
        },
      );
}
