// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ffi';

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
        '/game': (BuildContext context) => new ScoreForm('', '', '', ''),
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

class ScoreForm extends StatefulWidget {
  String tonchaName = '';
  String nanchaName = '';
  String shachaName = '';
  String pechaName = '';
  ScoreForm(String tonchaName, String nanchaName, String shachaName,
      String pechaName) {
    this.tonchaName = tonchaName;
    this.nanchaName = nanchaName;
    this.shachaName = shachaName;
    this.pechaName = pechaName;
  }
  @override
  _ScoreFormState createState() => _ScoreFormState(
      this.tonchaName, this.nanchaName, this.shachaName, this.pechaName);
}

class _ScoreFormState extends State<ScoreForm> {
  String tonchaName = '';
  String nanchaName = '';
  String shachaName = '';
  String pechaName = '';

  _ScoreFormState(String tonchaName, String nanchaName, String shachaName,
      String pechaName) {
    this.tonchaName = tonchaName;
    this.nanchaName = nanchaName;
    this.shachaName = shachaName;
    this.pechaName = pechaName;
  }

  List<int> player1Scores = [];
  List<int> player2Scores = [];
  List<int> player3Scores = [];
  List<int> player4Scores = [];

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
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            player1Scores.add(int.tryParse(text));
                            debugPrint('run onChanged');
                          },
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            if (text.length > 0) {
                              this.player2Scores[0] = int.parse(text);
                            }
                          },
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            if (text.length > 0) {
                              this.player3Scores[0] = int.parse(text);
                            }
                          },
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            if (text.length > 0) {
                              this.player4Scores[0] = int.parse(text);
                            }
                          },
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '2',
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '3',
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '4',
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '合計',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          player1Scores
                              .fold(
                                  0, (previous, current) => previous + current)
                              .toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          player2Scores
                              .fold(
                                  0, (previous, current) => previous + current)
                              .toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          player3Scores
                              .fold(
                                  0, (previous, current) => previous + current)
                              .toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          player4Scores
                              .fold(
                                  0, (previous, current) => previous + current)
                              .toString(),
                          textAlign: TextAlign.center,
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
                      builder: (BuildContext context) => ScoreForm(
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
