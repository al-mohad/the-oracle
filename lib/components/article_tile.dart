import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oracle/articles.dart';
import 'package:oracle/screens/detailed_screen.dart';
import 'package:oracle/utils/functions.dart';
import 'package:oracle/utils/text_styles.dart';

class ArticleTile extends StatelessWidget {
  final String title;
  final String urlToImage;
  final String publishedAt;
  final ArticlesData newsArticle;
  final int newsIndex;

  ArticleTile({
    Key key,
    @required this.title,
    @required this.urlToImage,
    @required this.publishedAt,
    this.newsArticle,
    this.newsIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => DetailsScreen(
                newsArticle: newsArticle,
                newsIndex: newsIndex,
              ),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(urlToImage ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        '${title.length > 20 ? title.substring(0, 40) : title}'
                        '...',
                        style: articleTitle,
                      ),
                    ),
                    Text(
                      formatPublishedTime(publishedAt),
                      style: articleSubtitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
