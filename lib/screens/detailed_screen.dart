import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oracle/articles.dart';
import 'package:oracle/components/share_button.dart';
import 'package:oracle/utils/functions.dart';
import 'package:oracle/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final int newsIndex;
  final ArticlesData newsArticle;

  const DetailsScreen({Key key, this.newsIndex, this.newsArticle})
      : super(key: key);
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
//
//  Future<void> _createEmail(String eSubject, String eBody) async {
//    const emailaddress = 'mailto:?subject=$eSubject&body=$eBody';
//
//    if (await canLaunch(emailaddress)) {
//      await launch(emailaddress);
//    } else {
//      throw 'Could not Email';
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.53,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          newsArticle.articles[newsIndex].urlToImage),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context)),
                            IconButton(
                                icon: Icon(
                                  Icons.bookmark_border,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context))
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                        child: Text(
                          newsArticle.articles[newsIndex].title,
                          style: mySubtitleStyle.copyWith(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text(
                            newsArticle.articles[newsIndex].description,
                            style: mySubtitleStyle.copyWith(
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            newsArticle.articles[newsIndex].content,
                            style: mySubtitleStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  newsArticle.articles[newsIndex].source.name,
                                  style: topHeadlinesStyle.copyWith(
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(formatPublishedTime(newsArticle
                                    .articles[newsIndex].publishedAt)),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ShareButton(
                                icon: FontAwesomeIcons.facebookF,
                                onTap: () {},
                              ),
                              ShareButton(
                                icon: FontAwesomeIcons.twitter,
                                onTap: () {},
                              ),
                              ShareButton(
                                icon: FontAwesomeIcons.solidEnvelope,
                                onTap: () {},
                              ),
                              ShareButton(
                                icon: FontAwesomeIcons.shareAlt,
                                onTap: () {},
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => _launchInBrowser(
                                    newsArticle.articles[newsIndex].url),
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Read more',
                                      style:
                                          header2Style.copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
//Hero(
//tag: 'doctorPic',
//child: Container(
//width: MediaQuery.of(context).size.width,
//height: 400,
//decoration: BoxDecoration(
//image: DecorationImage(
//image: NetworkImage(widget.news['urlToImage']),
//fit: BoxFit.cover,
//),
//),
//),
//),
//Scaffold(
//body: Container(
//decoration: BoxDecoration(
//image: DecorationImage(
//image: NetworkImage(widget.news['urlToImage']),
//fit: BoxFit.cover),
//),
//width: MediaQuery.of(context).size.width,
//child: DraggableScrollableSheet(
//minChildSize: 0.50,
//// maxChildSize: 1.0,
//expand: true,
//builder: (BuildContext context,
//    ScrollController scrollController) {
//return Container(
//padding: EdgeInsets.only(top: 15),
//decoration: BoxDecoration(
//color: Colors.white,
//borderRadius: BorderRadius.only(
//topLeft: Radius.circular(40),
//topRight: Radius.circular(40),
//),
//),
//child: SingleChildScrollView(
//controller: scrollController,
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//SizedBox(height: 5),
//Center(
//child: Container(
//width: 50,
//height: 5,
//decoration: BoxDecoration(
//borderRadius: BorderRadius.circular(16),
//color: Colors.black54,
//),
//),
//),
//SizedBox(height: 14),
//Container(
//margin: EdgeInsets.symmetric(horizontal: 30),
//width: MediaQuery.of(context).size.width,
//child: Row(
//mainAxisAlignment:
//MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Container(
//height: 90,
//child: Image.network(
//'',
//fit: BoxFit.cover,
//),
//),
//SizedBox(width: 10),
//Container(
//width: 200,
//child: Column(
//crossAxisAlignment:
//CrossAxisAlignment.start,
//children: <Widget>[],
//),
//)
//],
//),
//),
//Container(
//padding: EdgeInsets.only(left: 25),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[],
//),
//),
//SizedBox(height: 20),
//],
//),
//),
//);
//},
//),
//),
//)
