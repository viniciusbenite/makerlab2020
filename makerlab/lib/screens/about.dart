import 'package:flutter/material.dart';
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
              image:
                  'https://makerlab2020.herokuapp.com/static/img/Makerlab_About.jpg',
              text: 'What is Makerlab?',
            ),
          ),
          GestureDetector(
            onTap: () {
              //TODO
            },
            child: CardView(
              image:
                  'https://makerlab2020.herokuapp.com/static/img/Project_About.jpg',
              text: 'Project and Team',
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: CardView(
              image:
                  'https://makerlab2020.herokuapp.com/static/img/Wiki_About.jpg',
              text: 'About Wiki',
            ),
          ),
        ],
      ),
    );
  }
}
