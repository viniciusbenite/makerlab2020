import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:makerlab/models/equipment.dart';
import 'package:makerlab/models/project.dart';

Future<Project> createProject(String url, {Map body}) async {
  return http.post(url, body: json.encode(body), headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  }).then((response) {
    print(response.statusCode);
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    return Project.fromJson(json.decode(response.body));
  });
}

Future<List<Project>> getProjects(String url) async {
  return http.get(url).then((value) {
    final int statusCode = value.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return json.decode(value.body).map((e) => Project.fromJson(e)).toList();
  });
}

Future<List<Equipment>> getEquipments(String url) async {
  return http.get(url).then((value) {
    List<Equipment> eqs = [];
    var j = json.decode(value.body);
    for (int i = 0; i < j.length; i++) {
      eqs.add(Equipment.fromJson(j[i]));
    }
    return eqs;
  });
}

getMaxCodeOfProject() async {
  var project =
      await http.get('https://makerlab2020.herokuapp.com/tech/projects/');
  var decoded = json.decode(project.body);

  if (decoded.length == 0) return 0;

  var largerCodeProject = decoded[0];
  for (int i = 1; i < decoded.length; i++) {
    if (decoded[i]['code'] > largerCodeProject['code'])
      largerCodeProject = decoded[i];
  }
  return largerCodeProject['code'];
}
