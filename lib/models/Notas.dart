import 'package:flutter/material.dart';

enum NotaColor { Red, Green, Blue, Yello, Orange, Purple }

class Nota {
  int id;
  String title;
  String content;
  DateTime fecha;
  NotaColor color;

  //Constructor
  Nota(
      {this.id,
      @required this.title = '',
      this.content = '',
      this.fecha = DateTime.now(),
      @required this.color = NotaColor.Red});
}

var NOTAS = <Nota>[];
