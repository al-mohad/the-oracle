import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oracle/utils/text_styles.dart';

class ArticleTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text('5'),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      'Egypt is on Edge as Security  Tightens Over Protest',
                      style: articleTitle,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Sept. 26, 2019',
                        style: articleSubtitle,
                      ),
                      SizedBox(width: 10),
                      Text('·'),
                      SizedBox(width: 10),
                      Text(
                        '1:41 PM',
                        style: articleSubtitle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
