import 'package:flutter/material.dart';
import 'package:flutter_order/page/DropButton.dart';
import 'package:flutter_order/page/ListPage.dart';

class Router {
  static const String root = "/";
  static const String list = "/list";
  static const String button = "/button";

  static void goPage(BuildContext context, String route,
      {Map<String, String> map}) {
    switch (route) {
      case root:

      case list:
        listRoute(context);
        break;
      case button:
        buttonRoute(context);
        break;
    }
  }

  static void listRoute(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ListPage();
    }));
  }

  static void buttonRoute(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DropButton();
    }));
  }
}
