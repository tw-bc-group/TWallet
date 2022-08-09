import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/apply_vc_info_store.dart';

class VerifiableCredentialWithButtonCard extends StatelessWidget {
  final VcType vcType;
  final VcStatus vcStatus;
  final Function() onFinish;
  final Color bgColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  VerifiableCredentialWithButtonCard({
    required this.vcType,
    required this.vcStatus,
    required this.onFinish,
    this.bgColor = Colors.white,
    this.isSelected = false,
    this.onTap,
  });

  final ApplyVcInfoStore applyStore = Get.find();

  @override
  Widget build(BuildContext context) {
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
                _buildVcInfo(),
                _applyStatusInfo(context),
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
        height: 60,
        margin: const EdgeInsets.only(left: 10),
        child: Text.rich(
          TextSpan(
            style: WalletFont.font_12(),
            children: <TextSpan>[
              TextSpan(
                text: "${vcType.name}\n",
                style:
                    WalletFont.font_16(textStyle: const TextStyle(height: 2)),
              ),
              TextSpan(
                text: "${vcType.content.join("、")}\n",
                style: const TextStyle(textBaseline: TextBaseline.alphabetic),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _applyStatusInfo(BuildContext context) {
    switch (vcStatus) {
      case VcStatus.applied:
        {
          return const Text(
            "已申请",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          );
        }

      case VcStatus.rejected:
        {
          return const Text(
            "已拒绝",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          );
        }

      default:
        {
          return Column(
            children: <Widget>[
              WalletTheme.button(
                text: '申请',
                onPressed: () {
                  applyStore.vcType = vcType;
                  Application.router
                      .navigateTo(context, Routes.newVcPage)
                      .then((_) => onFinish());
                },
              ),
            ],
          );
        }
    }
  }
}
