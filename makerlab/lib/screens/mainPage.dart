import 'package:flutter/material.dart';
import 'package:makerlab/widgets/delayed_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  Widget _box(String text, Icon icon, Function onPressed) => Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: RaisedButton(
                onPressed: onPressed,
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
                  _box(
                    'Create Project',
                    Icon(Icons.build),
                      () {
                      Navigator.of(context).pushNamed("/create_project");
                    },
                  ),
                  _box(
                    'Rent Equipment',
                    Icon(Icons.group_work),
                      () {
                      //TODO: rent equipment
                      //Navigator.of(context).pushNamed("/rent_equipment");
                    },
                  ),
                  _box(
                    'Wiki',
                    Icon(Icons.local_library),
                      () async {
                      await launch(
                        "https://makerlab2020.herokuapp.com/wiki/missing-root/");
                    },
                  ),
                  _box(
                    'WebPage',
                    Icon(Icons.link),
                      () async {
                      await launch('https://makerlab2020.herokuapp.com/');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
