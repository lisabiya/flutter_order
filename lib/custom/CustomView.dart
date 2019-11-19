import 'package:flutter/material.dart';
import 'package:flutter_order/route/Router.dart';
import 'package:toast/toast.dart';

class BingInfo extends StatelessWidget {
  final imagePath;
  final text1;
  final EdgeInsetsGeometry margin;

  BingInfo(this.imagePath, this.text1, {this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment(-0.97, 0.97),
            children: <Widget>[
              Card(
                child: Image.network(imagePath),
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      text1,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NewsInfo extends StatelessWidget {
  final String imagePath;
  final String desc;
  final String data;
  final String author;
  final String url;
  var map = Map<String, String>();

  final EdgeInsetsGeometry margin;

  NewsInfo(this.imagePath, this.desc, this.author, this.data, this.url,
      {this.margin}) {
    map["url"] = url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        width: double.infinity,
        child: Card(
          child: Container(
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Router.goPage(context, Router.web, map: map);
                },
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 4,
                            right: 4,
                            left: 4,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxWidth: double.infinity, maxHeight: 140),
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                  desc,
                                  textDirection: TextDirection.ltr,
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 4.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                  data,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 4.0,
                            right: 4.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                  author,
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        child: Image.network(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
