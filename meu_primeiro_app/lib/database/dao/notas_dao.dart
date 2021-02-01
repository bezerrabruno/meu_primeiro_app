import 'package:sqflite/sqflite.dart';
import 'package:meu_primeiro_app/database/app_database.dart';

import 'package:meu_primeiro_app/models/notas.dart';

class NotasDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_titulo TEXT, '
      '$_descricao TEXT) ';

  static const String _tableName = 'notas';
  static const String _id = 'id';
  static const String _titulo = 'titulo';
  static const String _descricao = 'descricao';

  Future<int> save(Notas notas) async {
    final Database db = await getDatabase();
    Map<String, dynamic> notasMap = _toMap(notas);
    return db.insert(_tableName, notasMap);
  }

  Future delet(int id) async {
    final Database db = await getDatabase();
    return db.delete(_tableName, where: 'id = $id');
  }

  Map<String, dynamic> _toMap(Notas notas) {
    final Map<String, dynamic> notasMap = Map();
    notasMap[_titulo] = notas.titulo;
    notasMap[_descricao] = notas.descricao;
    return notasMap;
  }

  Future<List<Notas>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Notas> notas = _toList(result);
    return notas;
  }

  List<Notas> _toList(List<Map<String, dynamic>> result) {
    final List<Notas> notas = List();
    for (Map<String, dynamic> row in result) {
      final Notas mes = Notas(
        id: row[_id],
        titulo: row[_titulo],
        descricao: row[_descricao],
      );
      notas.add(mes);
    }
    return notas;
  }
}
