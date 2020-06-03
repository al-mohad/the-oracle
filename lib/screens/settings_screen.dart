import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oracle/components/buttons.dart';
import 'package:oracle/utils/text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.arrow_back),
                      Expanded(
                          child: Text(
                        'Settings',
                        style: headerStyle,
                      )),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'You are not a subscriber ',
                      )),
                      Button(
                        height: 30,
                        width: 70,
                        child: Center(child: Text('See options')),
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
                child: Container(
                  height: 120,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(),
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
                    Expanded(child: Text('My News Letter', style: headerStyle)),
                    Button(
                        height: 30,
                        width: 70,
                        child: Center(child: Text('Show Catalogue'))),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 9,
              itemBuilder: (_, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text('Breaking news alert 111'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Breaking news alert 111'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Breaking news alert 111'),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
