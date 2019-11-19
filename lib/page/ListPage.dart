import 'package:flutter/material.dart';
import 'package:flutter_order/custom/WanList.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var wanList = WanList();

  void _getData() {
    setState(() {
      wanList.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("玩安卓列表"),
      ),
      body: wanList,
      floatingActionButton: FloatingActionButton(
        onPressed: _getData,
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}
