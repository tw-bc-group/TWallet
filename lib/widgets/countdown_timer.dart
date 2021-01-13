import 'dart:async';

import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  Rx<Duration> remainTime = Rx(Duration.zero);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      remainTime.value = widget.before.difference(DateTime.now());
      if (remainTime.value <= const Duration()) {
        if (widget.atExpiration != null) {
          widget.atExpiration();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final String hintText = remainTime.value == Duration.zero
          ? ""
          : "剩余 ${printDuration(remainTime.value, locale: DurationLocale.fromLanguageCode('zh'))}";
      return Text(hintText);
    });
  }
}
