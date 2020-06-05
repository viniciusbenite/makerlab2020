import 'package:flutter/material.dart';

class CreateProject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateProjectState();
  }
}

class _CreateProjectState extends State<CreateProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Project'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Text(
                'Create a new project',
                style: Theme.of(context).textTheme.headline4,
              ),
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
            ),
          ),
        ],
      ),
    );
  }
}
