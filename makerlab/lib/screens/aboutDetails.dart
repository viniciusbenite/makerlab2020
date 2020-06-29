import 'package:flutter/material.dart';
import 'package:makerlab/utils/src.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(whatIsMakerlabTitle)),
      body: ListView(
        children: [
          Image.network(
            whatIsMakerlab,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          _whatIs,
        ],
      ),
    );
  }

  final Widget _whatIs = Container(
    padding: EdgeInsets.all(8.0),
    child: Text('''
      MakerLab is a IoT laboratory for the students and professors among all the University of Aveiro.\n
      It is located at the Department of Electronics, Telecommunication and Informatics.\n
      Every student can rent any equipment from there. Each electronic device or even circuit parts can be requested.
      '''),
  );
}

class TeamDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(aboutProjectAndTeamTitle),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/Vinicius.png',
                  width: 128,
                  height: 128,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Vinícius Benite',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/Mateusz.jpg',
                  width: 128,
                  height: 128,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Mateusz Roganowicz',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/Jakub.png',
                  width: 128,
                  height: 128,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Jakub Sztompka',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/Bernardo.jpg',
                  width: 128,
                  height: 128,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Bernardo Rodrigues',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/Miguel.jpg',
                  width: 128,
                  height: 128,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Miguel Matos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}

class AboutWiki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(aboutWikiTitle)),
      body: ListView(
        children: [
          Image.network(
            aboutWiki,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          _text
        ],
      ),
    );
  }

  final Widget _text = Container(
    padding: EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text('''
        Now students can browse through the WIKI implemented specially for the convenience. 
        Users will be able to easily browse throught equipments and their details.
        '''),
        InkWell(
          child: Text('WIKI'),
          onTap: () {
            return launch(wikiUrl);
          },
        ),
      ],
    ),
  );
}
