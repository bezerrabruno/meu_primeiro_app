import 'package:flutter/material.dart';

import 'criador_notas.dart';

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
    Notas nota1 = Notas('1', '123');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Lista de Notas'),
      ),
      floatingActionButton: FloatingActionButton(
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
      ),
      body: ListView(
        children: [
          ItemNota(nota1),
          ItemNota(nota1),
          ItemNota(nota1),
          ItemNota(nota1),
          ItemNota(nota1),
          ItemNota(nota1),
        ],
      ),
    );
  }
}

class ItemNota extends StatelessWidget {
  final Notas _nota;

  ItemNota(this._nota);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.note),
      title: Text(_nota.titulo),
      subtitle: Text(_nota.descricao),
    ));
  }
}

class Notas {
  final String titulo;
  final String descricao;

  static int numeroNotas = 0;

  Notas(
    this.titulo,
    this.descricao,
  ) {
    numeroNotas++;
  }
}
