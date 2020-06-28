import 'package:flutter/material.dart';
import 'package:makerlab/models/equipment.dart';

class Equipments extends StatefulWidget {
  @override
  _EquipmentsState createState() => new _EquipmentsState();
}

class _EquipmentsState extends State<Equipments> {
  //mocked initial data todo fetch from api
  List<Equipment> equipments = [
    Equipment(
      id: 0,
      description: "description",
      details: "details",
      family: "family",
      inStock: 1,
      status: "status",
      isChecked: false,
    ),
    Equipment(
      id: 1,
      description: "description1",
      details: "details1",
      family: "family1",
      inStock: 11,
      status: "status1",
      isChecked: false,
    ),
  ];

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
            visible: equipments.map((e) => e.isChecked).toList().contains(true),
          )
        ],
      ),
      body: StreamBuilder(
        initialData: equipments,
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
              child: Text('You haven\'t rent any equipments yet'),
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
        return ListTile(
          title: Row(
            children: [
              Checkbox(
                value: eq.isChecked,
                onChanged: (value) {
                  setState(() {
                    eq.isChecked = value;
                  });
                },
              ),
              Expanded(
                child: Text(eq.family + ', ' + eq.description),
              ),
            ],
          ),
          onTap: () {
//            _showContent(eq);
          },
        );
      },
    );
  }
}
