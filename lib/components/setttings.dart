import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oracle/models/settings_model.dart';
import 'package:oracle/utils/text_styles.dart';
import 'package:oracle/utils/the_oracle_data.dart';
import 'package:oracle/utils/theme.dart';
import 'package:provider/provider.dart';

Widget buildSettingsBottomSheetModal(BuildContext context) {
  var _lightTheme = true;
  final themeNotifier = Provider.of<ThemeNotifier>(context);
  _lightTheme = (themeNotifier.getTheme() == lightTheme);
  String selectedCategory = 'Nigeria';
  void getDropDownItems() {
    for (int i = 0; i < countriesMap.length; i++) {
      String country = countriesMap[i];
      DropdownMenuItem(
        child: Text(country),
        value: country,
      );
    }
  }

  void onThemeChanged(bool value, ThemeNotifier themNotifier) async {
    (value)
        ? themNotifier.setTheme(darkTheme)
        : themNotifier.setTheme(lightTheme);
  }

  return Container(
    color: Color(0xff757575),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: <Widget>[
                Text('The Oracle', style: headerStyle),
                Spacer(),
                Icon(FontAwesomeIcons.solidMoon),
                CupertinoSwitch(
                  activeColor: Colors.black,
                  value: _lightTheme,
                  onChanged: (value) {
                    _lightTheme = value;
                  },
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Change Country',
                  style: header2Style,
                ),
                DropdownButton<String>(
                    value: selectedCategory,
                    items: [
                      DropdownMenuItem(
                        child: Text('Nigeria'),
                        value: 'Nigeria',
                      ),
                      DropdownMenuItem(
                        child: Text('Ghana'),
                        value: 'Ghana',
                      ),
                    ],
                    onChanged: (h) {})
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
