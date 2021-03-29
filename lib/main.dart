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
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MainPage(),
        '/game': (BuildContext context) => new GamePage('', '', '', ''),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        backgroundColor: Colors.green,
      ),
      body: MemberForm(),
    );
  }
}

class GamePage extends StatelessWidget {
  String tonchaName = '';
  String nanchaName = '';
  String shachaName = '';
  String pechaName = '';

  GamePage(String tonchaName, String nanchaName, String shachaName,
      String pechaName) {
    this.tonchaName = tonchaName;
    this.nanchaName = nanchaName;
    this.shachaName = shachaName;
    this.pechaName = pechaName;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: 20,
            ),
            child: Container(
              padding: EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Table(
                    border: TableBorder.all(),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          Container(),
                          Text(
                            this.tonchaName,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            this.nanchaName,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            this.shachaName,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            this.pechaName,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      TableRow(children: [
                        Text(
                          '1',
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '2',
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(signed: true),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '3',
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '4',
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                        ),
                      ]),
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: new Text('戻る'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
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
      child: Column(
        children: <Widget>[
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
          ),
          Center(
            child: RaisedButton(
              child: new Text('対局開始'),
              onPressed: () => {
                Navigator.push(
                    context,
                    new MaterialPageRoute<Null>(
                      settings: const RouteSettings(name: '/game'),
                      builder: (BuildContext context) => GamePage(
                          _tonController.text,
                          _nanController.text,
                          _shaController.text,
                          _peController.text),
                    ))
              },
            ),
          )
        ],
      ),
    );
  }
}
