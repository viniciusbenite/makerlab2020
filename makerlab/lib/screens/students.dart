import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentState();
  }
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            elevation: 8.0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text('Rent Equipment'),
              ),
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          Card(
            elevation: 8.0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text('Return Equipment'),
              ),
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          Card(
            elevation: 8.0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text('Create Project'),
              ),
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          Card(
            elevation: 8.0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text('My Projects'),
              ),
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          Card(
            elevation: 8.0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text('Wiki'),
              ),
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ],
      ),
    );
  }
}
