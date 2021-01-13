import 'dart:async';

import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    Key key,
    @required this.before,
    this.atExpiration,
  }) : super(key: key);

  final DateTime before;
  final Function atExpiration;

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer _timer;
  Duration remainTime;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      update();
    });
  }

  void update() {
    setState(() {
      remainTime = widget.before.difference(DateTime.now());
    });

    if (remainTime <= const Duration()) {
      if (widget.atExpiration != null) {
        widget.atExpiration();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final remainTimeTxt = printDuration(
        remainTime,
        locale: DurationLocale.fromLanguageCode('zh')
    );

    if(remainTime !=null) {
      return Text("剩余 $remainTimeTxt");
    } else {
      return const Text("");
    }
  }
}
