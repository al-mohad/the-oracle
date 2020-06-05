import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oracle/utils/constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var newsArticles;
  searchNews(String searchTerm) async {
    String url = '$kHeadlinesUrl?country=us&apiKey=$kNewsAPIKEY';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var _newsArticles = jsonDecode(response.body)['articles'];

      setState(() {
        newsArticles = _newsArticles;
        print(newsArticles);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            margin:
                EdgeInsets.only(bottom: 0, top: 50.0, left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(FontAwesomeIcons.newspaper),
                SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.search)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 13,
              itemBuilder: (_, index) {
                return Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    child: ListTile(
                      title: Text('Title'),
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
