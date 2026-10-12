import '../models/carta.dart';

class Tabla {
  // Las filas y columnas de la cuadrícula con sus respectivas cartas
  final List<List<Carta>> filas;
  
  // Una cuadrícula espejo hecha de puros booleanos (true/false) para saber si la celda ya fue marcada
  final List<List<bool>> marcadas;

  Tabla._(this.filas, this.marcadas);

  // Constructor para armar la tabla con un acomodo fijo (muy útil en las pruebas)
  Tabla.desdeFilas(this.filas) 
      : marcadas = List.generate(4, (_) => List.generate(4, (_) => false));

  // Genera una tabla nueva barajando aleatoriamente las 16 cartas y repartiéndolas de 4 en 4
  static Tabla generar(List<Carta> cartas) {
    final copia = List<Carta>.from(cartas)..shuffle();
    final filas = <List<Carta>>[];
    for (var f = 0; f < 4; f++) {
      filas.add(copia.sublist(f * 4, f * 4 + 4));
    }
    return Tabla.desdeFilas(filas);
  }

  // Revisa toda la tabla buscando la carta cantada; si la encuentra, pone esa celda en 'true' (marcada)
  void marcar(Carta carta) {
    for (var f = 0; f < filas.length; f++) {
      for (var c = 0; c < filas[f].length; c++) {
        if (filas[f][c] == carta) {
          marcadas[f][c] = true;
          return; // ¡Encontrada y marcada! Nos salimos del ciclo.
        }
      }
    }
  }
}