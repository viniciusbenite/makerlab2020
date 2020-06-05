import 'package:flutter/material.dart';
import 'package:makerlab/utils/src.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectsState();
  }
}

class _ProjectsState extends State<Projects> {
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
            child: Center(
              child: Text('Rent Equipment',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Center(
              child: Text('Return Equipment',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Center(
              child: Text('Create Project',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Center(
              child: Text('My Projects',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            elevation: 6.0,
            onPressed: () {
              launch(wikiUrl);
            },
            child: Center(
              child: Text('Wiki',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
        ],
      ),
    );
  }
}
