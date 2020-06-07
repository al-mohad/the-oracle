import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oracle/articles.dart';
import 'package:oracle/screens/detailed_screen.dart';
import 'package:oracle/utils/text_styles.dart';

class HeadlineTile extends StatelessWidget {
  final String newsAuthor;
  final String newsTitle;
  final String newsDescription;
  final String newsContents;
  final String newsUrlToImage;
  final String newsUrl;
  final String newsSourceName;
  final DateTime newsPublishedAt;
  final ArticlesData newsArticle;
  final int newsIndex;

  HeadlineTile(
      {Key key,
      this.newsAuthor,
      this.newsTitle,
      this.newsContents,
      this.newsDescription,
      this.newsUrlToImage,
      this.newsUrl,
      this.newsPublishedAt,
      this.newsSourceName,
      this.newsIndex,
      this.newsArticle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => DetailsScreen(
              newsIndex: newsIndex,
              newsArticle: newsArticle,
            ),
          )),
      child: Container(
        width: 280,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(newsUrlToImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Icon(FontAwesomeIcons.bookmark),
                  color: Colors.white,
                  onPressed: () {}),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(bottom: 50.0, left: 10.0),
                child: Text(newsTitle, style: topHeadlinesStyle),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  margin: EdgeInsets.only(bottom: 10.0, left: 10.0),
                  child: Text(
                    newsAuthor,
                    style: topHeadlinesStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
