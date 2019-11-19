import 'package:flutter/material.dart';
import 'package:flutter_order/custom/CustomView.dart';
import 'package:flutter_order/route/Router.dart';
import 'package:flutter_order/widge/ItemButton.dart';
import 'package:permission_handler/permission_handler.dart';

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

  void res() async {
    PermissionStatus permission =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Router.goPage(context, Router.list);
              },
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.home),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              ItemButton("玩安卓", () {
                Router.goPage(context, Router.list);
              }),
              ItemButton("DropDown Button", () {
                Router.goPage(context, Router.button);
              }),
              ItemButton("火标网", () {
                Router.goPage(context, Router.web);
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}
