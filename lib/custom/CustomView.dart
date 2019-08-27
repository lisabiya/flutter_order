import 'package:flutter/material.dart';

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

  final EdgeInsetsGeometry margin;

  NewsInfo(this.imagePath, this.desc, this.author, this.data, {this.margin});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 220,
      width: double.infinity,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(4),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 4.0,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: double.infinity,maxHeight: 100),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            desc,
                            softWrap: true,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0,),
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
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18.0),
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
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
