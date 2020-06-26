import 'package:flutter/material.dart';

class RentEquipment extends StatefulWidget {
  @override
  _RentEquipmentState createState() => _RentEquipmentState();
}

class _RentEquipmentState extends State<RentEquipment> {
  bool isItemChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Equipment'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !isItemChecked
          ? null
          : FloatingActionButton.extended(
              onPressed: null,
              label: Text('Rent'),
            ),
    );
  }
}
