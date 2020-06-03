import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String image;
  final String text;

  CardView({@required this.image, @required this.text});

  @override
  Widget build(BuildContext context) {
    return 
      Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
          ],
        ),
      );
  }
}
