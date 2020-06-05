import 'package:flutter/cupertino.dart';
import 'package:oracle/articles.dart';
import 'package:oracle/components/headlineTile.dart';

class Headlines extends StatelessWidget {
  const Headlines({
    Key key,
    @required this.newsArticles,
  }) : super(key: key);

  final ArticlesData newsArticles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newsArticles.articles.length,
      itemBuilder: (_, index) {
        return HeadlineTile(
          newsUrlToImage: newsArticles.articles[index].urlToImage ?? '',
          newsPublishedAt:
              DateTime.parse(newsArticles.articles[index].publishedAt),
          newsSourceName: newsArticles.articles[index].source.name,
          newsUrl: newsArticles.articles[index].url,
          newsAuthor: newsArticles.articles[index].author ?? 'Unknown Author',
          newsTitle: newsArticles.articles[index].title ?? '',
          newsContents: newsArticles.articles[index].content,
          newsDescription: newsArticles.articles[index].description,
          news: newsArticles.articles[index],
        );
      },
    );
  }
}
