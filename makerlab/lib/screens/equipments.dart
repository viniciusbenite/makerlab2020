import 'package:flutter/material.dart';
import 'package:makerlab/widgets/delayed_animations.dart';
import 'package:makerlab/widgets/tableRow.dart';

class Equipments extends StatefulWidget {
  @override
  _EquipmentsState createState() => new _EquipmentsState();
}

class _EquipmentsState extends State<Equipments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: DelayedAnimation(
                    delay: 500,
                    child: Text(
                      'Return Items',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                TableRowCustom(
                  text: ['#ID', 'Family', 'Description'],
                  index: index,
                ),
              ],
            );
          }
          return GestureDetector(
            onTap: () {
              print('TODO');
            },
            child: TableRowCustom(
              text: ['#ID', 'Family', 'Description'],
              index: index,
            ),
          );
        },
      ),
    );
  }
}
