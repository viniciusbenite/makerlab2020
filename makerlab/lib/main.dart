import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const primaryColor = Colors.indigo;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DETI MakerLab',
      theme: ThemeData(
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DETI MakerLab'),
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
  final Widget _leading = Builder(builder: (BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  });

  final Widget _drawer = Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          // TODO: change header
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.accessibility),
          title: Text('Staff'),
        ),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text('Students'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('About'),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: _leading,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
            ),
          ],
        ),
      ),
      // Left menu
      drawer: _drawer,
    );
  }
}
