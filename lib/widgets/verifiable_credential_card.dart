import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_icon.dart';

class VerifiableCredentialCard extends StatelessWidget {
  final VerifiableCredential vc;
  final bool isSelected;
  final GestureTapCallback? onTap;

  const VerifiableCredentialCard({
    required this.vc,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = vc.isMissing() ? Colors.grey : Colors.white;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: <Widget>[
                const VcIcon(),
                _buildVcInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVcInfo() {
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(left: 10),
        child: Text.rich(
          TextSpan(
            style: WalletFont.font_12(),
            children: <TextSpan>[
              TextSpan(
                text: "${vc.name}\n",
                style:
                    WalletFont.font_16(textStyle: const TextStyle(height: 2)),
              ),
              TextSpan(text: "颁发者：${vc.issuer}\n"),
              _applicationTime(),
              TextSpan(
                text: "凭证信息：${vc.content.join("、")}\n",
                style: const TextStyle(textBaseline: TextBaseline.alphabetic),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _applicationTime() {
    if (vc.isMissing()) {
      return TextSpan(
        text: "申请时间：未申请该凭证，可返回申请\n",
        style: WalletFont.font_12(
          textStyle: TextStyle(color: WalletColor.red, height: 2),
        ),
      );
    }
    return TextSpan(
      text:
          "申请时间：${DateFormat('yyyy-MM-dd kk:mm').format(vc.applicationTime!)}\n",
    );
  }
}
