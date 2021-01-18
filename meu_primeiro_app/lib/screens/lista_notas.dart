import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/database/dao/notas_dao.dart';

import 'package:meu_primeiro_app/models/notas.dart';
import 'package:meu_primeiro_app/components/card_nota.dart';
import 'package:meu_primeiro_app/screens/criador_notas.dart';

const _tituloAppBar = 'Notas';

class ListaNotas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaNotasState();
  }
}

class ListaNotasState extends State<ListaNotas> {
  NotasDao _dao = NotasDao();
  @override
  Widget build(BuildContext context) {
    return tela();
  }

  Widget tela() {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: appBar(),
        floatingActionButton: floatbutton(),
        body: FutureBuilder<List<Notas>>(
            future: _dao.findAll(),
            initialData: List<Notas>(),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              final List<Notas> _notas = snapshot.data;
              return ListView.builder(
                itemCount: _notas.length,
                itemBuilder: (contex, index) {
                  final Notas _nota = _notas[index];
                  return CardNota(_nota);
                },
              );
            }));
  }

  Widget appBar() {
    return AppBar(
      title: Text(_tituloAppBar),
    );
  }

  Widget floatbutton() {
    return FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CriadorNotas();
          }));
        });
  }
}
