import 'dart:async';

import 'package:flutter/material.dart';
import 'package:makerlab/utils/login.dart';

final KEY = '_9521a91079fe9d915a122cd9a4e1ed89408362d78a';
final SECRET = '_a00574ad74f99ca06e6de74eb73532a2c8aa5c3cbe';

class LoginPage extends StatefulWidget {
  final String title = 'Login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final requestUrl = Uri.parse('http://identity.ua.pt/oauth/request_token?');
  final authorizeUrl = Uri.parse('http://identity.ua.pt/oauth/authorize');
  final accessTokenUrl = Uri.parse('http://identity.ua.pt/oauth/access_token');
  final getDataUrl = Uri.parse('http://identity.ua.pt/oauth/get_data');

  Map userProfile = {
    'name': null,
    'email': null,
    'token': null,
  };

  Future<Map<String, String>> getClient() async {
    var login = UALogin(KEY, SECRET);
    var resp = await login.requestToken();
    print(resp.body);
    var list = resp.body.split("&");
    Map<String, String> data = {};
    for (var l in list) {
      data[l.split("=")[0]] = data[l.split("=")[1]];
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                await getClient();
              },
              child: Text('Login'),
            ),
            TextFormField(
//              decoration: ,
                )
          ],
        ),
      ),
    );
  }
}
