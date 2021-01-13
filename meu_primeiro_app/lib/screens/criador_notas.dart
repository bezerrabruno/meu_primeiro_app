import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/screens/lista_notas.dart';

const _tituloAppBar = 'Criador de notas';
const _tituloNomeManga = 'Titulo';
const _tituloTotalCapitulos = 'Descricao';
const _dicaNomeManga = 'Vingança';
const _dicaTotalCapitulos = 'A vingança nunca é ...';

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
        appBar: _appBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Editor(
              _tituloNomeManga,
              _dicaNomeManga,
              _controladorCampotitulo,
            ),
            Editor(
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
      backgroundColor: Colors.black,
      title: Text(_tituloAppBar),
    );
  }

  void _criaNota(BuildContext context) {
    final String _titulo = (_controladorCampotitulo.text);
    final String _descricao = (_controladorCampodescricao.text);
    if (_titulo != '' && _descricao != '') {
      final notacriada = Notas(_titulo, _descricao);
      Navigator.pop(context, notacriada);
    }
  }
}

class Editor extends StatelessWidget {
  final String titulo;
  final String dica;
  final TextEditingController controlador;

  Editor(
    this.titulo,
    this.dica,
    this.controlador,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: titulo,
          hintText: dica,
        ),
      ),
    );
  }
}
