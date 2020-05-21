import 'package:avataaar_image/avataaar_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optional/optional_internal.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({this.hasBoarder: false, this.avataaar, this.width: 45});

  final double width;
  final Optional<Avataaar> avataaar;
  final bool hasBoarder;

  @override
  Widget build(BuildContext context) {
    final decoration = hasBoarder
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(width / 2),
            border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)))
        : null;

    return Container(
      decoration: decoration,
      child: SizedBox(
          width: width,
          height: width,
          child: avataaar
              .map<Widget>((v) => AvataaarImage(
                    width: width,
                    avatar: v,
                    errorImage: Icon(Icons.error),
                    placeholder: CircularProgressIndicator(),
                  ))
              .orElse(CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg')))),
    );
  }
}
