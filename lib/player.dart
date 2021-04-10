import 'package:flutter/material.dart';

class Player {
  final String name;
  const Player({
    @required this.name,
  }) : assert(name != null);
}
