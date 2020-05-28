import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset('assets/images/empty-box.svg'),
        const SizedBox(height: 25),
        const Text(
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
    );
  }
}
