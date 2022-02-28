import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/widgets/error_row.dart';

class TransferInputWidget extends StatelessWidget {
  final bool withPrefix;
  final ValueChanged<String> onChange;
  final String errorText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController? controller;

  const TransferInputWidget(
      {this.withPrefix = true,
      required this.onChange,
      required this.errorText,
      required this.keyboardType,
      required this.inputFormatters,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: withPrefix ? 6 : 0,
          ),
          margin: const EdgeInsets.only(top: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: WalletColor.middleGrey),
          ),
          child: Row(
            children: <Widget>[
              if (withPrefix)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Text(
                    '￥',
                    style: WalletFont.font_18(),
                  ),
                ),
              Expanded(
                child: TextField(
                  maxLines: withPrefix ? 1 : 2,
                  controller: controller,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none),
                    ),
                  ),
                  style:
                      withPrefix ? WalletFont.font_18() : WalletFont.font_14(),
                  onChanged: onChange,
                ),
              )
            ],
          ),
        ),
        if (errorText != null) ErrorRowWidget(errorText: errorText)
      ],
    );
  }
}
