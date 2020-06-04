import 'package:flutter/material.dart';
import 'package:makerlab/utils/src.dart';

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
                  'https://makerlab2020.herokuapp.com/static/img/SomeDude1.jpg',
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
                        'Name Here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/SomeDude1.jpg',
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
                        'Name Here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/SomeDude1.jpg',
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
                        'Name Here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/SomeDude1.jpg',
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
                        'Name Here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://makerlab2020.herokuapp.com/static/img/SomeDude1.jpg',
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
                        'Name Here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}
