import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oracle/screens/detailed_screen.dart';
import 'package:oracle/utils/text_styles.dart';

class AllNews extends StatelessWidget {
  const AllNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 9,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => DetailsScreen(),
                  )),
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16)),
              ),
              title: Text(
                'Egypt is on Edge as Security  Tightens Over Protest',
                style: allNewsTitleStyle,
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    'Sept. 26, 2019',
                    style: mySubtitleStyle,
                  ),
                  SizedBox(width: 10),
                  Text('.'),
                  SizedBox(width: 10),
                  Text(
                    '1:41 PM',
                    style: mySubtitleStyle,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
