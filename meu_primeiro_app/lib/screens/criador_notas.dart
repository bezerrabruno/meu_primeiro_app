import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/components/coletor.dart';
import 'package:meu_primeiro_app/database/dao/notas_dao.dart';
import 'package:meu_primeiro_app/models/notas.dart';

const _tituloAppBar = 'Criador de notas';
const _tituloNomeManga = 'Titulo';
const _tituloTotalCapitulos = 'Descricao';
const _dicaNomeManga = 'Amor';
const _dicaTotalCapitulos = 'O verdadeiro amor é ...';

class CriadorNotas extends StatelessWidget {
  final TextEditingController _controladorCampotitulo = TextEditingController();
  final TextEditingController _controladorCampodescricao =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _tela(context);
  }

  Widget _tela(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: _appBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Coletor(
              _tituloNomeManga,
              _dicaNomeManga,
              _controladorCampotitulo,
            ),
            Coletor(
              _tituloTotalCapitulos,
              _dicaTotalCapitulos,
              _controladorCampodescricao,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaNota(context),
              color: Colors.teal[300],
              textColor: Colors.black,
            )
          ],
        )));
  }

  Widget _appBar() {
    return AppBar(
      title: Text(_tituloAppBar),
    );
  }

  void _criaNota(BuildContext context) {
    final String _titulo = (_controladorCampotitulo.text);
    final String _descricao = (_controladorCampodescricao.text);
    if (_titulo != '' && _descricao != '') {
      final notacriada = Notas(
        titulo: _titulo,
        descricao: _descricao,
      );
      NotasDao _dao = NotasDao();
      _dao.save(notacriada);
      Navigator.pop(context);
    }
  }
}
