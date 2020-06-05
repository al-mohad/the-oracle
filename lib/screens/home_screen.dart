import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oracle/articles.dart';
import 'package:oracle/components/all_news.dart';
import 'package:oracle/components/app_title.dart';
import 'package:oracle/components/headlines.dart';
import 'package:oracle/components/news_banner.dart';
import 'package:oracle/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static String country = 'us';
  static String newsCategory = 'health';
  ArticlesData allNews;
  ArticlesData headlineNews;

  getHeadlineNews() async {
    String url =
        '$kHeadlinesUrl?country=$country&category=$newsCategory&apiKey=$kNewsAPIKEY';
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var _decodedData = jsonDecode(response.body);
      setState(() {
        headlineNews = ArticlesData.fromJson(_decodedData);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getAllNews() async {
    String _url = '$kHeadlinesUrl?country=$country&apiKey=$kNewsAPIKEY';
    print(_url);
    var _response = await http.get(_url);

    if (_response.statusCode == 200) {
      var _decodedResponse = jsonDecode(_response.body);
      setState(() {
        allNews = ArticlesData.fromJson(_decodedResponse);
      });
    } else {
      print('Request failed with status: ${_response.statusCode}.');
    }
  }

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
  void initState() {
    super.initState();
    getHeadlineNews();
    getAllNews();
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
                  AppTitle(),
                  Spacer(),
                  NewsBanner(title: 'Nigerian Politics', showAll: () {}),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: headlineNews == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Headlines(newsArticles: headlineNews),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: NewsBanner(title: 'Middle East', showAll: () {}),
          ),
          Expanded(
            flex: 3,
            child: allNews == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : AllNews(newsArticles: allNews),
          ),
        ],
      ),
    );
  }
}
