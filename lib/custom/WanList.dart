import 'package:flutter/material.dart';
import 'package:flutter_order/custom/CustomView.dart';
import 'package:flutter_order/net/HttpRequest.dart';
import 'package:flutter_order/bean/Wan.dart';

class WanList extends StatefulWidget {
  void getData() {
    wanState.getData();
  }

  var wanState = _WanListState();

  @override
  _WanListState createState() => wanState;
}

class _WanListState extends State<WanList> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<BingInfo> bingList = new List();
  ListDataFactory dataFactory;

  void getData() {
    dataFactory.getData();
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    dataFactory = new ListDataFactory(bingList, () {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return bingList[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return new Container(height: 4.0, color: Colors.white);
          },
          itemCount: bingList.length),
    );
  }
}

class ListDataFactory {
  List<BingInfo> bingList;
  int page = 1;
  VoidCallback callRefresh;

  ListDataFactory(this.bingList, this.callRefresh);

  void getData() {
    getArticle((wan) {
      initWan(wan.data.datas);
    }, page);
  }

  void initWan(List<Article> articleList) {
    if (page == 1) bingList.clear();
    page++;
    for (Article article in articleList) {
      BingInfo info = BingInfo(article.envelopePic, article.niceDate);
      bingList.add(info);
    }
    callRefresh();
  }
}
