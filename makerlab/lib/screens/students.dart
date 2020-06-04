import 'package:flutter/material.dart';
import 'package:makerlab/utils/src.dart';
import 'package:url_launcher/url_launcher.dart';

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
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Center(
                child: Text('Rent Equipment'),
              ),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Center(
                child: Text('Return Equipment'),
              ),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Center(
                child: Text('Create Project'),
              ),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Center(
                child: Text('My Projects'),
              ),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            elevation: 6.0,
            onPressed: () {
              launch(wikiUrl);
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Center(
                child: Text('Wiki'),
              ),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
        ],
      ),
    );
  }
}
