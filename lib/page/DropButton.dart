import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  List _fruits = ["Apple", "Banana", "Pineapple", "Mango", "Grapes"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in fruits) {
      items.add(DropdownMenuItem(
          value: fruit,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.view_list,
                color: Colors.amber[400],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  fruit,
                  style: TextStyle(color: Colors.amber[400], fontSize: 15),
                ),
              ),
            ],
          )));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DropDown Button Example"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.network(
                  "https://images.gitee.com/uploads/images/2018/0724/182940_64b567bc_1841643.jpeg",
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "下拉选择水果: ",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 20),
                  ),
                ),
                DropdownButton(
                  value: _selectedFruit,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
