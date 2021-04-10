import 'package:flutter/material.dart';

class ScoreTable extends StatefulWidget {
  const ScoreTable();
  @override
  _ScoreTableState createState() => _ScoreTableState();
}

class _ScoreTableState extends State<ScoreTable> {
  List<TableRow> _rows = [];

  List<int> _player1Scores;
  List<int> _player2Scores;
  List<int> _player3Scores;
  List<int> _player4Scores;

  String _playrer1Name;
  String _playrer2Name;
  String _playrer3Name;
  String _playrer4Name;

  String _player1Sum;
  String _player2Sum;
  String _player3Sum;
  String _player4Sum;

  @override
  void initState() {
    super.initState();
    _player1Scores = [0, 0, 0];
    _player2Scores = [0, 0, 0];
    _player3Scores = [0, 0, 0];
    _player4Scores = [0, 0, 0];
    _player1Sum = _player1Scores
        .fold(
          0,
          (previous, current) => previous + current,
        )
        .toString();
    _player2Sum = _player2Scores
        .fold(
          0,
          (previous, current) => previous + current,
        )
        .toString();
    _player3Sum = _player3Scores
        .fold(
          0,
          (previous, current) => previous + current,
        )
        .toString();
    _player4Sum = _player4Scores
        .fold(
          0,
          (previous, current) => previous + current,
        )
        .toString();

    final _nameRow = TableRow(children: [
      Center(
        child: Icon(Icons.person),
      ),
      TextFormField(
        textAlign: TextAlign.center,
        onChanged: (input) {
          setState(() {
            _playrer1Name = input;
          });
        },
      ),
      TextFormField(
        textAlign: TextAlign.center,
        onChanged: (input) {
          setState(() {
            _playrer2Name = input;
          });
        },
      ),
      TextFormField(
        textAlign: TextAlign.center,
        onChanged: (input) {
          setState(() {
            _playrer3Name = input;
          });
        },
      ),
      TextFormField(
        textAlign: TextAlign.center,
        onChanged: (input) {
          setState(() {
            _playrer4Name = input;
          });
        },
      )
    ]);
    _rows.add(_nameRow);

    for (var i = 0; i < _player1Scores.length; i++) {
      _rows.add(TableRow(children: [
        Center(
          child: Text(
            (i + 1).toString(),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.numberWithOptions(signed: true),
          textAlign: TextAlign.center,
          onChanged: (input) {
            setState(() {
              _player1Scores[i] = int.parse(input);
              _player1Sum = _player1Scores
                  .fold(
                    0,
                    (previous, current) => previous + current,
                  )
                  .toString();
            });
          },
        ),
        TextFormField(
          keyboardType: TextInputType.numberWithOptions(signed: true),
          textAlign: TextAlign.center,
          onChanged: (input) {
            setState(() {
              _player2Scores[i] = int.parse(input);
              _player2Sum = _player2Scores
                  .fold(
                    0,
                    (previous, current) => previous + current,
                  )
                  .toString();
            });
          },
        ),
        TextFormField(
          keyboardType: TextInputType.numberWithOptions(signed: true),
          textAlign: TextAlign.center,
          onChanged: (input) {
            setState(() {
              _player3Scores[i] = int.parse(input);
              _player3Sum = _player3Scores
                  .fold(
                    0,
                    (previous, current) => previous + current,
                  )
                  .toString();
            });
          },
        ),
        TextFormField(
          keyboardType: TextInputType.numberWithOptions(signed: true),
          textAlign: TextAlign.center,
          onChanged: (input) {
            setState(() {
              _player4Scores[i] = int.parse(input);
              _player4Sum = _player4Scores
                  .fold(
                    0,
                    (previous, current) => previous + current,
                  )
                  .toString();
            });
          },
        ),
      ]));
    }
  }

  void _addRow() {
    setState(() {
      _player1Scores.add(0);
      _player2Scores.add(0);
      _player3Scores.add(0);
      _player4Scores.add(0);
      var len = _player1Scores.length;
      _rows.add(
        TableRow(children: [
          Center(
            child: Text(
              len.toString(),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(signed: true),
            textAlign: TextAlign.center,
            onChanged: (input) {
              setState(() {
                _player1Scores[len - 1] = int.parse(input);
                _player1Sum = _player1Scores
                    .fold(
                      0,
                      (previous, current) => previous + current,
                    )
                    .toString();
              });
            },
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(signed: true),
            textAlign: TextAlign.center,
            onChanged: (input) {
              setState(() {
                _player2Scores[len - 1] = int.parse(input);
                _player2Sum = _player2Scores
                    .fold(
                      0,
                      (previous, current) => previous + current,
                    )
                    .toString();
              });
            },
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(signed: true),
            textAlign: TextAlign.center,
            onChanged: (input) {
              setState(() {
                _player3Scores[len - 1] = int.parse(input);
                _player3Sum = _player3Scores
                    .fold(
                      0,
                      (previous, current) => previous + current,
                    )
                    .toString();
              });
            },
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(signed: true),
            textAlign: TextAlign.center,
            onChanged: (input) {
              setState(() {
                _player4Scores[len - 1] = int.parse(input);
                _player4Sum = _player4Scores
                    .fold(
                      0,
                      (previous, current) => previous + current,
                    )
                    .toString();
              });
            },
          ),
        ]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('麻雀点数管理🀄️'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: _rows,
            ),
            Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(children: [
                  Text(
                    '合計スコア',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _player1Sum,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _player2Sum,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _player3Sum,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _player4Sum,
                    textAlign: TextAlign.center,
                  )
                ])
              ],
            ),
            Center(
              child: ElevatedButton(
                child: Text('新しい行を追加'),
                onPressed: _addRow,
              ),
            )
          ]),
        ));
  }
}
