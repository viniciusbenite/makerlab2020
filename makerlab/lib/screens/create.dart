import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:makerlab/models/equipment.dart';
import 'package:makerlab/models/project.dart';
import 'package:makerlab/utils/requests.dart';
import 'package:makerlab/widgets/form_field.dart';

class CreateProject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateProjectState();
  }
}

class _CreateProjectState extends State<CreateProject> {
  Project project;
  List<Equipment> _equipments = [];
  List<String> _checked = [];

  @override
  void initState() {
    super.initState();
    _fetchEquipments();
    _getInitialProject();
  }

  ///
  /// fetch equipments in case the user wants to add one to the project
  ///
  Future<void> _fetchEquipments() async {
    _equipments = await getEquipments(
        'https://makerlab2020.herokuapp.com/tech/equipments/');
    setState(() {});
  }

  ///
  /// start initial project with the code bigger than the largest one so far
  ///
  Future<void> _getInitialProject() async {
    int code = await getMaxCodeOfProject();
    project = Project(
      code: code + 1,
      year: 1,
      semester: 1,
      equipment: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Project'),
        brightness: Brightness.dark,
        actions: [
          FlatButton(
            child: Text('SAVE'),
            onPressed: () async {
              //todo save project
              project.equipment = _checked;
              var uri = 'https://makerlab2020.herokuapp.com/tech/projects/';
              print(project);
              await createProject(uri, body: project.toMap());
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormFieldCostume(
                  label: 'Name',
                  child: TextFormField(
                    cursorColor: Theme
                      .of(context)
                      .cursorColor,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        project.name = text;
                      });
                    },
                  ),
                ),
                FormFieldCostume(
                  label: 'Short Name',
                  child: TextFormField(
                    cursorColor: Theme
                      .of(context)
                      .cursorColor,
                    decoration: InputDecoration(
                      labelText: 'Short Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        project.shortName = text;
                      });
                    },
                  ),
                ),
                FormFieldCostume(
                  label: 'Year',
                  child: SpinBox(
                    min: 1,
                    max: 7,
                    value: 1,
                    onChanged: (value) {
                      setState(() {
                        project.year = value.floor();
                      });
                    },
                  ),
                ),
                FormFieldCostume(
                  label: 'Semester',
                  child: SpinBox(
                    min: 1,
                    max: 2,
                    value: 1,
                    onChanged: (value) {
                      setState(() {
                        project.semester = value.floor();
                      });
                    },
                  ),
                ),
                FormFieldCostume(
                  label: 'Equipments',
                  child: Column(
                    children: _eqs(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _eqs() {
    List<Widget> x = [];
    for (int i = 0; i < _equipments.length; i++) {
      x.add(
        CheckboxListTile(
          value: _checked.contains(_equipments[i].ref),
          onChanged: (value) {
            setState(() {
              if (value) {
                if (!_checked.contains(_equipments[i].ref))
                  _checked.add(_equipments[i].ref);
              } else {
                if (_checked.contains(_equipments[i].ref))
                  _checked.remove(_equipments[i].ref);
              }
            });
          },
          title: Text(_equipments[i].family),
        ),
      );
    }
    return x;
  }
}
