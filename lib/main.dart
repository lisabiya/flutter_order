import 'package:flutter/material.dart';
import 'package:flutter_order/custom/CustomView.dart';
import 'package:flutter_order/route/Router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FLutter页面'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Router.goPage(context, Router.button);
              },
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.home),
              )),
          GestureDetector(
              onTap: () {
                Router.goPage(context, Router.list);
              },
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.format_list_bulleted),
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          BingInfo(
            "https://images.gitee.com/uploads/images/2018/0724/182940_64b567bc_1841643.jpeg",
            "夏目友人帐",
            margin: EdgeInsets.all(8),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Text(
              '点击数字变化:',
            ),
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}
