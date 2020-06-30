import 'package:flutter/material.dart';
import 'package:makerlab/models/project.dart';
import 'package:makerlab/utils/requests.dart';

class Projects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectsState();
  }
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Projects'),
        brightness: Brightness.dark,
      ),
      body: FutureBuilder(
        future:
            getProjects('https://makerlab2020.herokuapp.com/tech/projects/'),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ERROR!',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text('Make sure you have an Internet Connection'),
                  Text('${snapshot.error}'),
                ],
              ),
            );
          }
          if (!snapshot.hasData) {
            return new Center(
              child: CircularProgressIndicator(),
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
          title: Text(project.name),
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
            title: Text(project.name),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    title: Text('Project Name:'),
                    subtitle: Text(project.name),
                  ),
                  ListTile(
                    title: Text('Project Short Name:'),
                    subtitle: Text(project.shortName),
                  ),
                  ListTile(
                    title: Text('Year:'),
                    subtitle: Text("${project.year}"),
                  ),
                  ListTile(
                    title: Text('Semester:'),
                    subtitle: Text("${project.semester}"),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
