import 'package:flutter/material.dart';
import 'package:makerlab/widgets/delayed_animations.dart';

class MainScreen extends StatelessWidget {
  Widget _box(String text, Icon icon) => Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: RaisedButton(
                onPressed: () {},
                child: icon,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(32.0),
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Expanded(
            child: DelayedAnimation(
              child: Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  //TODO: Change logo
                  child: FlutterLogo(
                    size: 100,
                  ),
                  radius: 100.0,
                ),
              ),
              delay: 800,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  _box('Create Project', Icon(Icons.build)),
                  _box('Rent Equipment', Icon(Icons.group_work)),
                  _box('Wiki', Icon(Icons.local_library)),
                  _box('WebPage', Icon(Icons.link)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
