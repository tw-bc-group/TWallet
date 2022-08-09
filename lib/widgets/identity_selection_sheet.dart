import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';

import 'package:tw_wallet_ui/widgets/identity_card.dart';

typedef SheetItemTapCallback = void Function(int index);

class IdentitySelectionSheet extends StatelessWidget {
  final List<DecentralizedIdentity> identities;
  final SheetItemTapCallback? onSheetItemTap;
  final DecentralizedIdentity? selectedIdentity;

  const IdentitySelectionSheet({
    required this.identities,
    this.onSheetItemTap,
    this.selectedIdentity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _calBottomSheetHeight(context, identities.length),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            children: identities
                .asMap()
                .map(
                  (i, e) => MapEntry(
                    i,
                    GestureDetector(
                      onTap: () => onSheetItemTap!(i),
                      child: IdentityCard(
                        name: e.profileInfo.name,
                        did: e.did.toString(),
                        bgColor: WalletColor.identityCardBg,
                        isSelected: e == selectedIdentity,
                      ),
                    ),
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
  double? _calBottomSheetHeight(BuildContext context, int itemCount) {
    final double height = MediaQuery.of(context).size.height * 0.7;
    const everyCardHeight = 110.0;
    final int marginHeight = (itemCount - 1) * 20 + 24 + 22;
    if (height < everyCardHeight * itemCount + marginHeight) return height;
    return null;
  }
}
