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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Project'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Project Name',
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      labelText: 'Project Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        projectName = text;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Supervisor',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      labelText: 'Supervisor',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        supervisor = text;
                      });
                    },
                  ),
                ),
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
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    FlatButton(
                      onPressed: () async {
                        //TODO: add new project
                      },
                      child: Text('Confirm'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          mainAxisSize: MainAxisSize.max,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            Container(
//              padding: EdgeInsets.only(left: 16.0, top: 16.0),
//              child: Text(
//                'Project Name',
//                textAlign: TextAlign.start,
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.all(16.0),
//              child: TextFormField(
//                cursorColor: Theme.of(context).cursorColor,
//                decoration: InputDecoration(
//                  labelText: 'Project Name',
//                  border: OutlineInputBorder(),
//                ),
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.only(left: 16.0, top: 16.0),
//              child: Text(
//                'Supervisor',
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.all(16.0),
//              child: TextFormField(
//                cursorColor: Theme.of(context).cursorColor,
//                decoration: InputDecoration(
//                  labelText: 'Supervisor',
//                  border: OutlineInputBorder(),
//                ),
//              ),
//            ),
////            Row(
////              children: [
////                FlatButton(
////                  onPressed: () {},
////                  child: Text('Cancel'),
////                ),
////                FlatButton(
////                  onPressed: () {},
////                  child: Text('Confirm'),
////                ),
////              ],
////            )
//          ],
//        ),
      ),
    );
  }
}
