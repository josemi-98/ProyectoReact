import 'package:flutter/material.dart';

import 'pages/NotasForm.dart';

void main() {
  runApp(NotasApp());
}

class NotasApp extends StatelessWidget {
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: 'Bloc de Notas',
        theme: ThemeData(primaryColor: Colors.yellow, accentColor: Colors.orange),
        home: NotasForm(),
      );
    }
  


}

