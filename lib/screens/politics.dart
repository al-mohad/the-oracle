import 'package:flutter/material.dart';
import 'package:oracle/components/articleTile.dart';
import 'package:oracle/utils/text_styles.dart';

class PoliticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nigerian Politics', style: headerStyle),
        centerTitle: true,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 9,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: ArticleTile(),
          );
        },
      ),
    );
  }
}

//ListTile(
//leading: Container(
//height: 80,
//width: 70,
//decoration: BoxDecoration(
//color: Colors.blue,
//borderRadius: BorderRadius.circular(16),
//),
//child: Container(),
//),
//title: Text(
//'Egypt is on Edge as Security  Tightens Over Protest',
//style: articleTitle,
//),
//subtitle: Row(
//children: <Widget>[
//Text('Sept. 26, 2019'),
//SizedBox(width: 10),
//Text('.'),
//SizedBox(width: 10),
//Text('1:41 PM')
//],
//),
//),
