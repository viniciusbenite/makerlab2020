import 'package:flutter/material.dart';

class TableRowCustom extends StatelessWidget {
  final List<String> text;
  final int index;

  TableRowCustom({@required this.text, @required this.index});

  @override
  Widget build(BuildContext context) {
    Color color;
    if (index == 0) {
      color = Theme.of(context).primaryColorDark;
    } else if (index % 2 != 0)
      color = Theme.of(context).primaryColorLight;
    else
      color = Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _widget(),
        ),
      ),
    );
  }

  List<Widget> _widget() {
    List<Widget> allText = [];
    for (int i = 0; i < text.length; i++) {
      allText.add(Text(
        text[i],
        style: TextStyle(
          color: index == 0 || index % 2 == 0 ? Colors.white : Colors.black,
          fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
        ),
      ));
    }
    return allText;
  }
}
