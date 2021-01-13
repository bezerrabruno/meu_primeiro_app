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
