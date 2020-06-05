import 'package:flutter/cupertino.dart';
import 'package:oracle/components/headlineTile.dart';

class Headlines extends StatelessWidget {
  const Headlines({
    Key key,
    @required this.newsArticles,
  }) : super(key: key);

  final newsArticles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newsArticles.length,
      itemBuilder: (_, index) {
        return HeadlineTile(
          newsUrlToImage: newsArticles[index]['urlToImage'] ?? '',
          newsPublishedAt: DateTime.parse(newsArticles[index]['publishedAt']),
          newsSourceName: newsArticles[index]['source']['name'],
          newsUrl: newsArticles[index]['url'],
          newsAuthor: newsArticles[index]['author'] ?? 'Unknown Author',
          newsTitle: newsArticles[index]['title'] ?? '',
          newsContents: newsArticles[index]['content'],
          newsDescription: newsArticles[index]['description'],
          news: newsArticles[index],
        );
      },
    );
  }
}
