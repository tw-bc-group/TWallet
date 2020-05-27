import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/identity.dart';

import 'identity_card.dart';

typedef SheetItemTapCallback = void Function(int index);

class IdentitySelectionSheet extends StatelessWidget {
  final List<Identity> identities;
  final SheetItemTapCallback onSheetItemTap;

  const IdentitySelectionSheet(
      {@required this.identities, this.onSheetItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _calBottomSheetHeight(context, identities.length),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            children: identities
                .asMap()
                .map(
                  (i, e) => MapEntry(
                    i,
                    GestureDetector(
                      onTap: () => onSheetItemTap(i),
                      child: IdentityCard(
                        name: e.name,
                        did: e.did.toString(),
                        bgColor: WalletColor.identityCardBg,
                        isSelected: e.isSelected ?? false,
                      ),
                    )
                  ),
                )
                .values
                .toList(),
          ),
        ),
      ),
    );
  }

  // TODO: get height dynamic
  _calBottomSheetHeight(BuildContext context, int itemCount) {
    var height = MediaQuery.of(context).size.height * 0.7;
    const everyCardHeight = 110.0;
    var marginHeight = (itemCount - 1) * 20 + 24 + 22;
    if (height < everyCardHeight * itemCount + marginHeight) return height;
  }
}
