import 'package:flutter/material.dart';
import 'package:makerlab/models/equipment.dart';
import 'package:makerlab/utils/requests.dart';

class Equipments extends StatefulWidget {
  @override
  _EquipmentsState createState() => new _EquipmentsState();
}

class _EquipmentsState extends State<Equipments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Equipments'),
        brightness: Brightness.dark,
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
        return ListTile(
          title: Text(eq.family),
          onTap: () {
            _showContent(eq);
          },
        );
      },
    );
  }

  void _showContent(Equipment equipment) {
    showDialog(
      context: context,
      builder: (ctx) {
        return new AlertDialog(
          title: Text(equipment.family),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  title: Image.network(equipment.imageUrl),
                ),
                ListTile(
                  title: Text('ref: '),
                  subtitle: Text(equipment.ref.toString()),
                ),
                ListTile(
                  title: Text('Description: '),
                  subtitle: Text(equipment.description),
                ),
                ListTile(
                  title: Text('Family: '),
                  subtitle: Text(equipment.family),
                ),
                ListTile(
                  title: Text('Status: '),
                  subtitle: Text(equipment.status),
                ),
                ListTile(
                  title: Text('Location: '),
                  subtitle: Text(equipment.location),
                ),
                ListTile(
                  title: Text('Total Items: '),
                  subtitle: Text("${equipment.totalItems}"),
                ),
                ListTile(
                  title: Text('Borrowed Items: '),
                  subtitle: Text("${equipment.borrowedItems}"),
                ),
                ListTile(
                  title: Text('Price: '),
                  subtitle: Text(equipment.price.toString()),
                ),
                ListTile(
                  title: Text('Broken: '),
                  subtitle: Text(equipment.broken),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
