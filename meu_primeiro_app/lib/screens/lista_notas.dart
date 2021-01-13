import 'package:flutter/material.dart';

import 'package:meu_primeiro_app/models/notas.dart';
import 'package:meu_primeiro_app/components/card_nota.dart';
import 'package:meu_primeiro_app/screens/criador_notas.dart';

const _tituloAppBar = 'Notas';

class ListaNotas extends StatefulWidget {
  final List<Notas> _notas = List();
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
        backgroundColor: Colors.grey,
        appBar: appBar(),
        floatingActionButton: floatbutton(),
        body: ListView.builder(
          itemCount: widget._notas.length,
          itemBuilder: (contex, index) {
            Notas _nota = widget._notas[index];
            return CardNota(_nota);
          },
        ));
  }

  Widget appBar() {
    return AppBar(
      title: Text(_tituloAppBar),
    );
  }

  Widget floatbutton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        final Future<Notas> future =
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CriadorNotas();
        }));
        future.then((notaRecebida) {
          if (notaRecebida != null) {
            setState(() => widget._notas.add(notaRecebida));
          }
        });
      },
    );
  }
}
