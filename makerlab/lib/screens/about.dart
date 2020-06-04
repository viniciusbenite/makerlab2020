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
              Navigator.of(context).pushNamed("/about/what");
            },
            child: CardView(
              image: whatIsMakerlab,
              text: whatIsMakerlabTitle,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/about/project");
            },
            child: CardView(
              image: aboutProjectAndTeam,
              text: aboutProjectAndTeamTitle,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: CardView(
              image: aboutWiki,
              text: aboutWikiTitle,
            ),
          ),
        ],
      ),
    );
  }
}
