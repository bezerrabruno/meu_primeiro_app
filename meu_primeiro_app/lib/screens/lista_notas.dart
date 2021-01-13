import 'package:flutter/material.dart';

class ListaNotas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaNotasState();
  }
}

class ListaNotasState extends State<ListaNotas> {
  @override
  Widget build(BuildContext context) {
    return tela();
  }

  Widget tela() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Notas'),
      ),
      body: ListView(
        children: [
          Text('nota 1.'),
          Text('nota 1.'),
          Text('nota 1.'),
          Text('nota 1.'),
          Text('nota 1.'),
          Text('nota 1.'),
        ],
      ),
    );
  }
}
