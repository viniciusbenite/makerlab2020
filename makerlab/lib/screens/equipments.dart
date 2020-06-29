import 'package:flutter/material.dart';
import 'package:makerlab/utils/requests.dart';

class Equipments extends StatefulWidget {
  @override
  _EquipmentsState createState() => new _EquipmentsState();
}

class _EquipmentsState extends State<Equipments> {
  var _checked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Return Equipments'),
        brightness: Brightness.dark,
        actions: [
          Visibility(
            child: FlatButton(
              child: Icon(
                Icons.check,
                size: 50,
              ),
              onPressed: () {},
            ),
            visible: _checked.length > 0,
          )
        ],
      ),
      body: FutureBuilder(
        future: getEquipments(
            'https://makerlab2020.herokuapp.com/tech/equipments/'),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'ERROR!',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text('Make sure you have an Internet Connection'),
                ],
              ),
            );
          }
          if (!snapshot.hasData) {
            return new Center(
              child: CircularProgressIndicator(),
            );
          }
          return _column(snapshot.data);
        },
      ),
    );
  }

  Widget _column(eqs) {
    return ListView.builder(
      itemCount: eqs.length,
      itemBuilder: (ctx, i) {
        var eq = eqs[i];
        print(_checked.contains(eq));
        return CheckboxListTile(
          value: _checked.contains(eq),
          title: Text(eq.family),
          onChanged: (value) {
            setState(() {
              if (value) {
                if (!_checked.contains(eq))
                  _checked.add(eq);
              } else {
                if (_checked.contains(eq))
                  _checked.remove(eq);
              }
            });
          },
        );
      },
    );
  }
}
