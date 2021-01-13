import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/models/notas.dart';

class CardNota extends StatelessWidget {
  final Notas _nota;

  CardNota(this._nota);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(_nota.titulo),
      subtitle: Text(_nota.descricao),
    ));
  }
}
