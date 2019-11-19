import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatefulWidget {
  final String webUrl;

  WebPage({this.webUrl});

  @override
  _WebPageState createState() => _WebPageState(webUrl: webUrl);
}

class _WebPageState extends State<WebPage> {
  String webUrl;

  final _webviewPlugin = FlutterWebviewPlugin();

  _WebPageState({this.webUrl}) {
    print(webUrl);
    if (webUrl == null) {
      webUrl = "http://wap.huobiao.cn/";
    }
  }

  @override
  void initState() {
    super.initState();
    _webviewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
              child: WebviewScaffold(
            url: webUrl,
          )),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    left: 16,
                    child: gestureIcon(
                        Icon(Icons.arrow_back, color: Colors.white), () {
                      _webviewPlugin.canGoBack().then((canBack) {
                        if (canBack) _webviewPlugin.goBack();
                      });
                    })),
                Positioned(
                  child: gestureIcon(Icon(Icons.home, color: Colors.white), () {
                    _webviewPlugin.reloadUrl("https://www.dogedoge.com/");
                  }),
                ),
                Positioned(
                  right: 16,
                  child:
                      gestureIcon(Icon(Icons.refresh, color: Colors.white), () {
                    _webviewPlugin.reload();
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //附带点击事件的Icon
  GestureDetector gestureIcon(Icon icon, VoidCallback callback) {
    return GestureDetector(onTap: callback, child: icon);
  }
}
