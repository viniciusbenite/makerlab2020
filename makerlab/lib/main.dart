import 'package:flutter/material.dart';
import 'package:makerlab/screens/what.dart';
import 'package:makerlab/widgets/fab.dart';

import 'screens/about.dart';

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
      ),
      home: MyHomePage(title: 'DETI MakerLab'),
      routes: {
        '/about/what': (context) => WhatMakerlab(),
        '/about/project': (context) => null,
        '/about/wiki': (context) => null,
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Text('0'),
    Text('0'),
    Text('0'),
    AboutPage(),
  ];

  _selectedTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        color: Colors.grey,
        notchedShape: CircularNotchedRectangle(),
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Staff'),
          FABBottomAppBarItem(iconData: Icons.local_library, text: 'Students'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'About'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
