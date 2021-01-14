import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Notas.dart';

class NotasForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Nota nota = Nota();

  String _validateTitle(String value) {
    if (value == null || value == '') {
      return 'El titulo de la nota es obligatorio';
    }
    if (value.length < 4) {
      return 'El titulo de la nota no puede tener menos de 4 caracteres';
    }
  }

  saveForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      NOTAS.add(nota);
      nota = Nota();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Nota'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(onPressed: () {}, child: Text('Cancelar')),
            FlatButton(onPressed: saveForm, child: Text('Guardar'))
          ],
        ),
      ),
      //primer widget es el form con dos atributos key es obligatorio
      body: Form(
        key: _formKey,
        child: Column(children: [
          ListTile(
              leading: Icon(Icons.title),
              title: TextFormField(
                validator: _validateTitle,
                onSaved: (newValue) => nota.title = newValue,
                decoration: InputDecoration(hintText: 'Titulo de la nota'),
              )),
          ListTile(
            leading: Icon(Icons.content_copy),
            title: TextFormField(
              onSaved: (newValue) => nota.content = newValue,
              maxLines: 8,
              decoration: InputDecoration(hintText: 'Contenido de la nota'),
            ),
          )
        ]),
      ),
    );
  }
}
