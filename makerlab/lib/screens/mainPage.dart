import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makerlab/widgets/delayed_animations.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: This page is still a mess, do later
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://cdn.noitesaudavel.pt/news/0000000000109/1568630397.jpg',
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(64.0),
            child: Center(
              child: DelayedAnimation(
                child: Text(
                  'MAKERLAB',
                  style: Theme.of(context).textTheme.headline4,
                ),
                delay: 500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(32.0),
                        child: Text('data'),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('data'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                    ),
                    RaisedButton(
                      onPressed: () {},
                    ),
                    RaisedButton(
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 180,
          )
        ],
      ),
    );
  }
}
