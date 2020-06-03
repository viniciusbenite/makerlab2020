import 'package:flutter/material.dart';
import 'package:makerlab/widgets/card.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          CardView(
            image: 'https://makerlab2020.herokuapp.com/static/img/Makerlab_About.jpg',
            text: 'What is Makerlab?',
          ),
          CardView(
            image: 'https://makerlab2020.herokuapp.com/static/img/Project_About.jpg',
            text: 'Project and Team',
          ),
          CardView(
            image: 'https://makerlab2020.herokuapp.com/static/img/Wiki_About.jpg',
            text: 'About Wiki',
          ),
        ],
      ),
    );
  }
}
