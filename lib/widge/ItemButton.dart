import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemButton extends StatefulWidget {
  final itemName;
  final VoidCallback onPressed;

  ItemButton(this.itemName, this.onPressed);

  @override
  _ItemButtonState createState() => _ItemButtonState(onPressed, itemName);
}

class _ItemButtonState extends State<ItemButton> {
  var itemName;
  VoidCallback onPressed;

  _ItemButtonState(this.onPressed, this.itemName);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
        onPressed: () {
          onPressed();
        },
        color: Colors.white,
        highlightColor: Colors.lightBlue[100],
        icon: Icon(
          Icons.radio,
          color: Colors.lightBlue,
        ),
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(itemName),
        ));
  }
}

