import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/screens/lista_notas.dart';

void main() => runApp(Notes());

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
      ),
      home: ListaNotas(),
    );
  }
}
