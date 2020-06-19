import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makerlab/screens/aboutDetails.dart';
import 'package:makerlab/screens/create.dart';
import 'package:makerlab/screens/homePage.dart';
import 'package:makerlab/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DETI MakerLab',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: LoginPage(),
      routes: {
        '/about/what': (context) => WhatDetails(),
        '/about/project': (context) => TeamDetails(),
        '/about/wiki': (context) => AboutWiki(),
        '/create_project': (context) => CreateProject(),
        '/home': (context) => MyHomePage(title: 'DETI Makerlab'),
      },
    );
  }
}
