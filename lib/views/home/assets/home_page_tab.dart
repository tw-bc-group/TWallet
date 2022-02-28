import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePageTab extends StatelessWidget {
  final Widget icon;
  final String text;

  const HomePageTab({required this.icon, required this.text});

  Widget _buildLabelText() {
    return Text(
      text,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 20, top: 2, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[icon, _buildLabelText()],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text, defaultValue: null));
    properties
        .add(DiagnosticsProperty<Widget>('icon', icon, defaultValue: null));
  }
}
