import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oracle/components/buttons.dart';
import 'package:oracle/screens/search_screen.dart';
import 'package:oracle/utils/text_styles.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: Text('The Oracle', style: headerStyle)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button(
              height: 40,
              width: 40,
              child: Icon(
                FontAwesomeIcons.search,
                size: 20,
              ),
              onTap:
//                                () => showModalBottomSheet(
//                                context: context, builder: buildSearchWidget),
                  () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => SearchScreen(),
                ),
              ),
            ),
            SizedBox(width: 10),
            Button(
              height: 40,
              width: 40,
              child: Icon(
                FontAwesomeIcons.cog,
                size: 20,
              ),
            ),
            SizedBox(width: 10),
            Button(
              height: 40,
              width: 40,
              child: Icon(
                FontAwesomeIcons.infoCircle,
                size: 20,
              ),
              onTap: () => showAboutDialog(
                  context: context,
                  applicationVersion: '1.0.0',
                  applicationName: 'The Oracle',
                  applicationIcon: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 40,
                    width: 40,
                  ),
                  applicationLegalese: 'The Oracle is News app that....'),
            ),
          ],
        ),
      ],
    );
  }
}