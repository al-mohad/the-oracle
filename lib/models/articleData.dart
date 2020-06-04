import 'dart:collection';

import 'package:oracle/models/articles.dart';

class ArticleData {
  List<Article> _articles = [];

  UnmodifiableListView get articles {
    return UnmodifiableListView(_articles);
  }

  void addArticle(String name, desc, url, pic, cate, lang, cont) {
    _articles.add(Article(
      name: name,
      description: desc,
      url: url,
      photo: pic,
      category: cate,
      language: lang,
      country: cont,
    ));
  }
}
