import 'package:flutter/material.dart';

class Staff extends StatefulWidget {
  @override
  _StaffState createState() => new _StaffState();
}

class _StaffState extends State<Staff> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 1,
        children: [
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Center(
              child: Text(
                'Requests',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Center(
              child: Text(
                'Edit Equipment',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 6.0,
            child: Center(
              child: Text(
                'Statistics',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            color: Theme.of(context).primaryColorLight,
          ),
        ],
      ),
    );
  }
}
