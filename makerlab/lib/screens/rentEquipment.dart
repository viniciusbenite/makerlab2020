import 'package:flutter/material.dart';
import 'package:makerlab/models/equipment.dart';

class RentEquipment extends StatefulWidget {
  @override
  _RentEquipmentState createState() => _RentEquipmentState();
}

class _RentEquipmentState extends State<RentEquipment> {
  //TODO: fetch from API, this is just for testing purposes
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

  var itemsChecked = [];

  List<Equipment> _getItemsChecked(List<Equipment> eqs) => eqs
      .map((e) => e.isChecked ? e : null)
      .where((element) => element != null)
      .toList();

  @override
  Widget build(BuildContext context) {
    //add equipments checked to
    itemsChecked = _getItemsChecked(equipments);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Equipment'),
      ),
      body: ListView.builder(
        itemCount: equipments.length,
        itemBuilder: (ctx, i) {
          var eq = equipments[i];
          return ListTile(
            title: Row(
              children: [
                Checkbox(
                  value: eq.isChecked,
                  onChanged: (value) {
                    setState(() {
                      eq.isChecked = value;
                      itemsChecked = _getItemsChecked(equipments);
                    });
                  },
                ),
                Expanded(
                  child: Text(eq.family),
                ),
              ],
            ),
            onTap: () {
              _showContent(eq);
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          // check if there is an item checked
          !(equipments.map((e) => e.isChecked).toList().contains(true))
              ? null
              : FloatingActionButton.extended(
                  onPressed: () {
                    print(itemsChecked);
                  },
                  label: Text('Rent'),
                ),
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
                  title: Text('ID: '),
                  subtitle: Text(equipment.id.toString()),
                ),
                ListTile(
                  title: Text('Description: '),
                  subtitle: Text(equipment.description),
                ),
                ListTile(
                  title: Text('Details: '),
                  subtitle: Text(equipment.details),
                ),
                ListTile(
                  title: Text('Family: '),
                  subtitle: Text(equipment.family),
                ),
                ListTile(
                  title: Text('In Stock: '),
                  subtitle: Text(equipment.inStock.toString()),
                ),
                ListTile(
                  title: Text('Status: '),
                  subtitle: Text(equipment.status),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
