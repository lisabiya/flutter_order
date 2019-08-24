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
