import 'package:flutter/material.dart';

class Coletor extends StatelessWidget {
  final String titulo;
  final String dica;
  final TextEditingController controlador;

  Coletor(
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
