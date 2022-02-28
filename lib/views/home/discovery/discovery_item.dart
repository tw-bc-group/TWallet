import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class DiscoveryItem extends StatelessWidget {
  final String? text;
  final String? svgAsset;

  const DiscoveryItem({this.text, this.svgAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0f000000),
            offset: Offset(0, 4),
            blurRadius: 12,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  svgAsset ?? "assets/icons/health-cert.svg",
                  width: 44,
                  height: 44,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Text(
                      text!,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                        color: Color(0xff111111),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/icons/right-arrow.svg",
            width: 24,
            height: 24,
            color: const Color(0xff999aaa),
          ),
        ],
      ),
    );
  }
}
