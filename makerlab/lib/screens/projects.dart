import 'package:flutter/material.dart';
import 'package:makerlab/models/project.dart';

class Projects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectsState();
  }
}

class _ProjectsState extends State<Projects> {
  //mocked initial data todo fetch from api
  List<Project> projects = [
    Project(
      id: 0,
      year: 2020,
      semester: 2,
      projectName: 'DETI Makerlab',
      projectShortName: 'DML',
      supervisor: 'Diogo Gomes',
      numberOfTeamMembers: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Projects'),
        brightness: Brightness.dark,
      ),
      body: StreamBuilder(
        initialData: projects,
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'ERROR!',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text('Make sure you have an Internet Connection'),
                ],
              ),
            );
          }
          if (!snapshot.hasData) {
            return new Center(
              child: Text('You don\'t have any projects yet'),
            );
          }
          return _column(snapshot.data);
        },
      ),
    );
  }

  Widget _column(projects) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (ctx, i) {
        Project project = projects[i];
        return ListTile(
          title: Text(project.projectName),
          onTap: () {
            _showContent(project);
          },
        );
      },
    );
  }

  void _showContent(Project project) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(project.projectName),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  //todo finish this
                  ListTile(
                    title: Text('Project Name:'),
                    subtitle: Text(project.projectName),
                  ),
                  //...
                ],
              ),
            ),
          );
        });
  }
}
