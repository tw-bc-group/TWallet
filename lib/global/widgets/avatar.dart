import 'package:avataaar_image/avataaar_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optional/optional_internal.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({this.avataaar, this.width: 45});
  final double width;
  final Optional<Avataaar> avataaar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: width,
        child: avataaar
            .map<Widget>((v) => AvataaarImage(
                  avatar: v,
                  errorImage: Icon(Icons.error),
                  placeholder: CircularProgressIndicator(),
                ))
            .orElse(CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'))));
  }
}
