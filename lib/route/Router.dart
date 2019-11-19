import 'package:flutter/material.dart';
import 'package:flutter_order/page/DropButton.dart';
import 'package:flutter_order/page/ListPage.dart';
import 'package:flutter_order/page/WebPage.dart';

class Router {
  static const String root = "/";
  static const String list = "/list";
  static const String button = "/button";
  static const String web = "/web";

  static void goPage(BuildContext context, String route,
      {Map<String, String> map}) {
    switch (route) {
      case root:

      case list:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ListPage();
        }));
        break;
      case button:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DropButton();
        }));
        break;
      case web:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          if (map!=null&&map.containsKey("url")) {
            return WebPage(
              webUrl: map["url"],
            );
          } else {
            return WebPage();
          }
        }));
        break;
    }
  }
}
