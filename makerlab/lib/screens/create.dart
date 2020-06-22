import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';

class CreateProject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateProjectState();
  }
}

class _CreateProjectState extends State<CreateProject> {
  String projectName;
  String supervisor;
  int numberOfTeamMembers;

  Widget _box(String label) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                label,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  labelText: label,
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Project'),
        actions: [
          FlatButton(
            child: Text('SAVE'),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _box("Year"),
                _box("Semester"),
                _box("Project Name"),
                _box("Project Short Name"),
                _box("Supervisor"),
                Container(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Number of team members',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: SpinBox(
                    min: 1,
                    value: 1,
                    onChanged: (value) {
                      setState(() {
                        numberOfTeamMembers = value as int;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
