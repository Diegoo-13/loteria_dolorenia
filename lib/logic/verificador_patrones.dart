class VerificadorPatrones {
  // Revisa si alguna fila completa tiene todas sus celdas en true
  static bool hayLinea(List<List<bool>> marcadas) {
    for (final fila in marcadas) {
      if (fila.every((m) => m)) return true;
    }
    return false;
  }

  // Revisa si alguna columna completa tiene todas sus celdas en true de arriba a abajo
  static bool hayColumna(List<List<bool>> marcadas) {
    for (var c = 0; c < marcadas[0].length; c++) {
      var completa = true;
      for (var f = 0; f < marcadas.length; f++) {
        if (!marcadas[f][c]) {
          completa = false;
          break;
        }
      }
      if (completa) return true;
    }
    return false;
  }

  // Revisa las dos diagonales (la principal y la secundaria)
  static bool hayDiagonal(List<List<bool>> marcadas) {
    final n = marcadas.length;
    var principal = true;
    var secundaria = true;
    for (var i = 0; i < n; i++) {
      if (!marcadas[i][i]) principal = false;
      if (!marcadas[i][n - 1 - i]) secundaria = false;
    }
    return principal || secundaria;
  }

  // Método maestro: con que se cumpla cualquiera de las tres, ya ganaste
  static bool hayGanador(List<List<bool>> marcadas) {
    return hayLinea(marcadas) || hayColumna(marcadas) || hayDiagonal(marcadas);
  }
}