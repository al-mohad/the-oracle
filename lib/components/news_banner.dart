import 'package:flutter/material.dart';
import 'package:oracle/components/buttons.dart';
import 'package:oracle/utils/text_styles.dart';

class NewsBanner extends StatelessWidget {
  final String title;
  final Function showAll;

  NewsBanner({this.title, this.showAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: Text(title, style: header2Style)),
        Button(
          height: 30,
          width: 80,
          onTap: showAll,
          child: Center(
              child: Text(
            'Show all',
            style: mySubtitleStyle,
          )),
        ),
      ],
    );
  }
}
