import 'package:flutter/material.dart';
import 'package:makerlab/widgets/delayed_animations.dart';
import 'package:makerlab/widgets/tableRow.dart';

class Projects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectsState();
  }
}

class _ProjectsState extends State<Projects> {
  //TODO redo project
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0)
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: DelayedAnimation(
                    delay: 500,
                    child: Text(
                      'My Projects',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                // _tableRow("Number", "Project Name", "Supervisor", index),
                TableRowCustom(
                  text: ['Number', "Project Name", "Supervisor"],
                  index: index,
                )
              ],
            );
          return TableRowCustom(
            text: ['text1', "text2", "text3"],
            index: index,
          );
        },
      ),
    );
  }
}
