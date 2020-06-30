import 'package:flutter/material.dart';

class FormFieldCostume extends StatelessWidget {
  final String label;
  final Widget child;

  const FormFieldCostume({Key key, this.label, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              label,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: child,
          )
        ],
      ),
    );
  }
}
