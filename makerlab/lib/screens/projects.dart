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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: [
            TableRow(
              decoration:
                  BoxDecoration(color: Theme.of(context).primaryColorDark),
              children: [
                _text('Number', true),
                _text('Project Name', true),
                _text('Supervisor', true),
              ],
            ),
            TableRow(
              children: [
                Text('Number'),
                Text('Project Name'),
                Text('Supervisor'),
              ],
            ),
            TableRow(
              children: [
                Text('Number'),
                Text('Project Name'),
                Text('Supervisor'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String text, bool bold) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: bold? FontWeight.bold: FontWeight.normal,
            fontSize: 16
          ),
        ),
  );
}
