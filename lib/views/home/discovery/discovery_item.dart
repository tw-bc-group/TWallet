import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiscoveryItem extends StatelessWidget {
  final String text;

  const DiscoveryItem({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 48),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x0f000000),
            offset: Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/health-cert.svg",
                width: 44,
                height: 44,
              ),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/icons/right-arrow.svg",
            width: 24,
            height: 24,
            color: Color(0xff999aaa),
          ),
        ],
      ),
    );
  }
}
