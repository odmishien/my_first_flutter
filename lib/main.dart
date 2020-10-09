// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '麻雀点数計算',
      home: Scaffold(
        appBar: AppBar(
          title: Text('麻雀点数計算🀄️'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.sync),
              onPressed: () {},
            )
          ],
        ),
        body: MemberForm(),
      ),
    );
  }
}

class MemberForm extends StatefulWidget {
  @override
  _MemberFormState createState() => _MemberFormState();
}

class _MemberFormState extends State<MemberForm> {
  final _tonController = TextEditingController();
  final _nanController = TextEditingController();
  final _shaController = TextEditingController();
  final _peController = TextEditingController();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(children: <Widget>[
        Text('メンバー'),
        Row(
          children: <Widget>[
            Expanded(flex: 3, child: Text('東家: ')),
            Expanded(
              flex: 7,
              child: TextField(
                controller: _tonController,
                maxLength: 10,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(flex: 3, child: Text('南家: ')),
            Expanded(
              flex: 7,
              child: TextField(
                controller: _nanController,
                maxLength: 10,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(flex: 3, child: Text('西家: ')),
            Expanded(
              flex: 7,
              child: TextField(
                controller: _shaController,
                maxLength: 10,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(flex: 3, child: Text('北家: ')),
            Expanded(
              flex: 7,
              child: TextField(
                controller: _peController,
                maxLength: 10,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
