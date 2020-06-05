import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oracle/articles.dart';
import 'package:oracle/components/article_tile.dart';
import 'package:oracle/utils/constants.dart';

class SearchScreen extends StatefulWidget {
  final String currentCountry;

  const SearchScreen({Key key, this.currentCountry}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ArticlesData searchedArticles;
  TextEditingController searchController = TextEditingController();
  var newsArticles;
  searchNews(String searchTerm) async {
    searchedArticles = null;
    String url =
        '$kHeadlinesUrl?q=$searchTerm&country=${widget.currentCountry}&apiKey=$kNewsAPIKEY';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var _decodedData = jsonDecode(response.body);
      setState(() {
        searchedArticles = ArticlesData.fromJson(_decodedData);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(FontAwesomeIcons.newspaper),
                SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  icon: Icon(FontAwesomeIcons.search),
                  onPressed: () => searchNews(searchController.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: searchedArticles == null
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
                    itemCount: searchedArticles.articles.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: ArticleTile(
                            title: searchedArticles.articles[index].title,
                            urlToImage:
                                searchedArticles.articles[index].urlToImage,
                            publishedAt:
                                searchedArticles.articles[index].publishedAt),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
