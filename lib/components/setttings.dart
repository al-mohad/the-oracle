import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oracle/utils/text_styles.dart';
import 'package:oracle/utils/the_oracle_data.dart';

Widget buildSettingsBottomSheetModal(BuildContext context) {
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
                  value: true,
                  onChanged: (t) {},
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
