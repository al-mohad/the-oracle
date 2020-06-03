import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oracle/components/buttons.dart';
import 'package:oracle/screens/search_screen.dart';
import 'package:oracle/utils/constants.dart';
import 'package:oracle/utils/text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static String country = 'ng';
  String url =
      'https://newsapi.org/v2/sources?language=en&country=$country&apiKey=$kNewsAPIKEY';

  Widget buildSearchWidget(BuildContext context) {
    return Container(
      color: Color(0xff757576),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                              Icons.search,
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
                              Icons.settings,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Button(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.info,
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
                                applicationLegalese:
                                    'The Oracle is News app that....'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child:
                              Text('Nigerian Politics ', style: headerStyle)),
                      Button(
                        height: 30,
                        width: 70,
                        child: Center(child: Text('Show all')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 120,
                      width: 200,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: Text('Middle East', style: headerStyle)),
                    Button(
                        height: 30,
                        width: 70,
                        child: Center(child: Text('Show all'))),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 9,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    title: Text(
                        'Egypt is on Edge as Security  Tightens Over Protest'),
                    subtitle: Row(
                      children: <Widget>[
                        Text('Sept. 26, 2019'),
                        SizedBox(width: 10),
                        Text('.'),
                        SizedBox(width: 10),
                        Text('1:41 PM')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
