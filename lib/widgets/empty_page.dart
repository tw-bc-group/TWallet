import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('assets/images/empty-box.svg'),
          SizedBox(height: 25),
          Text(
            '暂无内容',
            style: TextStyle(
              fontFamily: 'PingFangHK',
              color: Color(0xff999aaa),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 1,
            ),
          )
        ],
      ),
    );
  }
}
