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

class InputScore {
  int score;
  bool isDirty;

  InputScore(int score, bool isDirty) {
    this.score = score;
    this.isDirty = isDirty;
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

  List<InputScore> player1Scores = [
    for (int i = 0; i < 3; i++) InputScore(0, false)
  ];
  List<InputScore> player2Scores = [
    for (int i = 0; i < 3; i++) InputScore(0, false)
  ];
  List<InputScore> player3Scores = [
    for (int i = 0; i < 3; i++) InputScore(0, false)
  ];
  List<InputScore> player4Scores = [
    for (int i = 0; i < 3; i++) InputScore(0, false)
  ];

  int rate = 10;
  int badai = 0;

  @override
  Widget build(BuildContext context) {
    var player1Sum =
        player1Scores.fold(0, (previous, current) => previous + current.score);
    var player2Sum =
        player2Scores.fold(0, (previous, current) => previous + current.score);
    var player3Sum =
        player3Scores.fold(0, (previous, current) => previous + current.score);
    var player4Sum =
        player4Scores.fold(0, (previous, current) => previous + current.score);
    final rows = <TableRow>[
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
    ];
    for (var i = 1; i < player1Scores.length; i++) {
      rows.add(TableRow(
        children: [
          Text(
            i.toString(),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(signed: true),
            onChanged: (text) {
              if (text.length > 0) {
                setState(() {
                  player1Scores[i] = InputScore(int.parse(text), true);
                  if (player2Scores[i].isDirty && player3Scores[i].isDirty) {
                    player4Scores[i] = InputScore(
                        0 -
                            player1Scores[i].score -
                            player2Scores[i].score -
                            player3Scores[i].score,
                        true);
                  }
                });
              }
            },
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(signed: true),
            onChanged: (text) {
              if (text.length > 0) {
                setState(() {
                  player2Scores[i] = InputScore(int.parse(text), true);
                });
              }
            },
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(signed: true),
            onChanged: (text) {
              if (text.length > 0) {
                setState(() {
                  player3Scores[i] = InputScore(int.parse(text), true);
                });
              }
            },
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(signed: true),
            onChanged: (text) {
              if (text.length > 0) {
                setState(() {
                  player4Scores[i] = InputScore(int.parse(text), true);
                });
              }
            },
          ),
        ],
      ));
    }
    rows.add(TableRow(children: [
      Text(
        '合計',
        textAlign: TextAlign.center,
      ),
      Text(
        player1Sum.toString(),
        textAlign: TextAlign.center,
      ),
      Text(
        player2Sum.toString(),
        textAlign: TextAlign.center,
      ),
      Text(
        player3Sum.toString(),
        textAlign: TextAlign.center,
      ),
      Text(
        player4Sum.toString(),
        textAlign: TextAlign.center,
      ),
    ]));
    rows.add(TableRow(children: [
      Text(
        '支払い',
        textAlign: TextAlign.center,
      ),
      Text(
        ((player1Sum * rate) - (badai / 4)).toString(),
        textAlign: TextAlign.center,
      ),
      Text(
        ((player2Sum * rate) - (badai / 4)).toString(),
        textAlign: TextAlign.center,
      ),
      Text(
        ((player3Sum * rate) - (badai / 4)).toString(),
        textAlign: TextAlign.center,
      ),
      Text(
        ((player4Sum * rate) - (badai / 4)).toString(),
        textAlign: TextAlign.center,
      ),
    ]));

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
        body: DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: 20,
          ),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            child: TextFormField(
                              initialValue: '10',
                              decoration: InputDecoration(
                                  labelText: "レート", suffixText: "円/ポイント"),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  this.rate = int.parse(value);
                                });
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "場代", suffixText: "円"),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  this.badai = int.parse(value);
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Table(
                      border: TableBorder.all(),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: rows,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () => {
                                    setState(() {
                                      player1Scores.add(InputScore(0, false));
                                      player2Scores.add(InputScore(0, false));
                                      player3Scores.add(InputScore(0, false));
                                      player4Scores.add(InputScore(0, false));
                                    }),
                                  },
                              child: new Text('新しい行を追加')),
                          RaisedButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            onPressed: () => Navigator.of(context).pop(),
                            child: new Text('戻る'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
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
