import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectsState();
  }
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0)
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'My Projects',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                _tableRow("Number", "Project Name", "Supervisor", index),
              ],
            );
          return _tableRow("text1", "text2", "text3", index);
        },
      ),
    );
  }

  Widget _tableRow(text1, text2, text3, index) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text1,
            style: TextStyle(
              color:
                  index == 0 || index % 2 == 0 ? Colors.white : Colors.black,
              fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color:
                  index == 0 || index % 2 == 0 ? Colors.white : Colors.black,
              fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            text3,
            style: TextStyle(
              color:
                  index == 0 || index % 2 == 0 ? Colors.white : Colors.black,
              fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
