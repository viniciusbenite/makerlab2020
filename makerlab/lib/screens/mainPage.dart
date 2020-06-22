import 'package:flutter/material.dart';
import 'package:makerlab/widgets/delayed_animations.dart';

class MainScreen extends StatelessWidget {
  Widget _box(String text) => Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: RaisedButton(
                onPressed: () {},
                child: Text('text'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(32.0),
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    //TODO: This page is still a mess, do later
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://makerlab2020.herokuapp.com/static/img/BackgroundMainCropped.png'),
            fit: BoxFit.cover),
      ),
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
                  _box('Create Project'),
                  _box('Rent Equipment'),
                  _box('Wiki'),
                  _box('WebPage'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
