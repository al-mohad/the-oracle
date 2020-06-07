import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oracle/articles.dart';
import 'package:oracle/components/article_tile.dart';

class HeadlineList extends StatelessWidget {
  final ArticlesData newsArticles;
  const HeadlineList({
    Key key,
    @required this.newsArticles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: newsArticles.articles.length,
          padding: EdgeInsets.only(top: 0.0),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ArticleTile(
                urlToImage: newsArticles.articles[index].urlToImage,
                title: newsArticles.articles[index].title,
                publishedAt: newsArticles.articles[index].publishedAt,
                newsArticle: newsArticles,
                newsIndex: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

//ListTile(
//onTap: () => Navigator.push(
//context,
//CupertinoPageRoute(
//builder: (_) => DetailsScreen(),
//)),
//leading: Container(
//height: 60,
//width: 60,
//decoration: BoxDecoration(
//color: Colors.blue,
//borderRadius: BorderRadius.circular(16)),
//),
//title: Text(
//'Egypt is on Edge as Security  Tightens Over Protest',
//style: allNewsTitleStyle,
//),
//subtitle: Row(
//children: <Widget>[
//Text(
//'Sept. 26, 2019',
//style: mySubtitleStyle,
//),
//SizedBox(width: 10),
//Text('.'),
//SizedBox(width: 10),
//Text(
//'1:41 PM',
//style: mySubtitleStyle,
//)
//],
//),
//),
