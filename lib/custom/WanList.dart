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

bool isPerformingRequest = false;

class _WanListState extends State<WanList> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<NewsInfo> bingList = new List();
  ListDataFactory dataFactory;
  bool isLoadingMore = false;

  ScrollController scrollController = ScrollController();

  void getData() {
    dataFactory.getData();
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    dataFactory = new ListDataFactory(bingList, () {
      setState(() {});
      this.isLoadingMore = false;
      isPerformingRequest = false;
    });

    /// 判断是否需要上拉加载
    this.scrollController.addListener(() {
      if (!this.isLoadingMore &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        this.loadMoreData();
      }
    });
  }

  /// 上拉加载
  void loadMoreData() {
    setState(() {
      isPerformingRequest = true;
      this.isLoadingMore = true;
    });
    getData();
  }

  /// 模拟下拉刷新
  Future<void> _onRefresh() async {
    if (isLoadingMore) {
      return;
    }
    setState(() {
      isLoadingMore = true;
    });
    dataFactory.refreshData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Colors.red[400],
        child: Container(
          margin: EdgeInsets.only(top: 8),
          child: ListView.separated(
              controller: this.scrollController,
              itemBuilder: (BuildContext context, int index) {
                if (index == bingList.length) {
                  return _buildProgressIndicator();
                } else {
                  return bingList[index];
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return new Container(height: 8.0, color: Colors.transparent);
              },
              itemCount: bingList.length + 1),
        ),
        onRefresh: _onRefresh);
  }
}

class ListDataFactory {
  List<NewsInfo> bingList;
  int page = 1;
  VoidCallback callRefresh;

  int getPage() {
    return page;
  }

  ListDataFactory(this.bingList, this.callRefresh) {
    getData();
  }

  void refreshData() {
    page = 1;
    getArticle((wan) {
      initWan(wan.data.datas);
    }, page);
  }

  void getData() {
    getArticle((wan) {
      initWan(wan.data.datas);
    }, page);
  }

  void initWan(List<Article> articleList) {
    if (page == 1) bingList.clear();
    page++;
    for (Article article in articleList) {
      NewsInfo info = NewsInfo(
          article.envelopePic, article.desc, article.author, article.niceDate);
      bingList.add(info);
      print(article.toString());
    }
    callRefresh();
  }
}

Widget _buildProgressIndicator() {
  return new Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Opacity(
        opacity: isPerformingRequest ? 1.0 : 0.0,
        child: CircularProgressIndicator(
          valueColor: LoadingStyleColor(),
        ),
      ),
    ),
  );
}

class LoadingStyleColor extends Animation<Color> {
  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void addStatusListener(listener) {
    // TODO: implement addStatusListener
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

  @override
  void removeStatusListener(listener) {
    // TODO: implement removeStatusListener
  }

  @override
  // TODO: implement status
  AnimationStatus get status => null;

  @override
  // TODO: implement value
  Color get value => Colors.grey;
}
