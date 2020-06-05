import 'package:flutter/material.dart';

class Equipments extends StatefulWidget {
  @override
  _EquipmentsState createState() => new _EquipmentsState();
}

class _EquipmentsState extends State<Equipments> {
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
