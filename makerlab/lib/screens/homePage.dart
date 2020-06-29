import 'package:flutter/material.dart';
import 'package:makerlab/screens/about.dart';
import 'package:makerlab/screens/equipments.dart';
import 'package:makerlab/screens/mainPage.dart';
import 'package:makerlab/screens/projects.dart';
import 'package:makerlab/widgets/fab.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MainScreen(),
    Equipments(),
    Projects(),
    AboutPage(),
  ];

  _selectedTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _showContent() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('What would you like to do?'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                ListTile(
                  title: Text('Create Project'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/create_project");
                  },
                ),
                ListTile(
                  title: Text('Rent Equipment'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/rent_equipment");
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BackgroundMainCropped.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        color: Colors.grey,
        notchedShape: CircularNotchedRectangle(),
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.build, text: 'Equipment'),
          FABBottomAppBarItem(iconData: Icons.group_work, text: 'Projects'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'About'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showContent,
        tooltip: 'Add',
        child: Icon(Icons.add),
        elevation: 4.0,
      ),
    );
  }
}
