import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/database/dao/notas_dao.dart';
import 'package:meu_primeiro_app/models/notas.dart';

class CardNota extends StatelessWidget {
  final Notas _nota;

  CardNota(this._nota);

  @override
  Widget build(BuildContext context) {
    NotasDao _dao = NotasDao();
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          title: Text(_nota.titulo),
          subtitle: Text(_nota.descricao),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: SizedBox(
            width: 150,
            height: 30,
            child: TextButton(
              onPressed: () => _dao.delet(_nota.id),
              child: Text('Delete'),
            ),
          ),
        ),
      ],
    ));
  }
}
