import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String newsAuthor;
  final String newsTitle;
  final String newsDescription;
  final String newsContents;
  final String newsUrlToImage;
  final String newsUrl;
  final String newsSourceName;
  final DateTime newsPublishedAt;

  const DetailsScreen(
      {Key key,
      this.newsAuthor,
      this.newsTitle,
      this.newsDescription,
      this.newsContents,
      this.newsUrlToImage,
      this.newsUrl,
      this.newsSourceName,
      this.newsPublishedAt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'photo',
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('url'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('url'), fit: BoxFit.cover),
                ),
                child: DraggableScrollableSheet(
                  minChildSize: 0.50,
                  // maxChildSize: 1.0,
                  expand: true,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      padding: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 5),
                            Center(
                              child: Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            SizedBox(height: 14),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 90,
                                    child: Image.network(
                                      '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'name',
                                        ),
                                        SizedBox(height: 10),
                                        Text('Speciality:'),
                                        SizedBox(height: 2),
                                        Text(
                                          'Years of Experience: 22yrs',
                                        ),
                                        SizedBox(height: 2),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Office Information',
                                  ),
                                  SizedBox(height: 5.0),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
