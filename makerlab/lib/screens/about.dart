import 'package:flutter/material.dart';
import 'package:makerlab/utils/src.dart';
import 'package:makerlab/widgets/card.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              //TODO
            },
            child: CardView(
              image: whatIsMakerlab,
              text: 'What is Makerlab?',
            ),
          ),
          GestureDetector(
            onTap: () {
              //TODO
            },
            child: CardView(
              image: aboutProjectAndTeam,
              text: 'Project and Team',
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: CardView(
              image: aboutWiki,
              text: 'About Wiki',
            ),
          ),
        ],
      ),
    );
  }
}
