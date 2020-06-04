import 'package:flutter/material.dart';
import 'package:makerlab/utils/src.dart';

class WhatMakerlab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What is DETI Makerlab?')
      ),
      body: Column(
        children: [
          Image.network(
            whatIsMakerlab,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

}