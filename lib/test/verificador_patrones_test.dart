import 'package:flutter_test/flutter_test.dart';
import 'package:loteria_dolorenia/logic/verificador_patrones.dart';

//! RONDA 6: Detectar una linea horizontal ganadora
void main() {
  test('detecta una linea horizontal completa', () {
    final marcadas = [
      [true, true, true, true],
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false],
    ];
    expect(VerificadorPatrones.hayLinea(marcadas), true); // <--- Fallará porque la clase no existe
  });

  test('no detecta linea si ninguna fila esta completa', () {
    final marcadas = [
      [true, true, true, false],
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false],
    ];
    expect(VerificadorPatrones.hayLinea(marcadas), false);
  });

//! RONDA 7: Detectar una columna ganadora
  test('detecta una columna vertical completa', () {
    final marcadas = [
      [true, false, false, false],
      [true, false, false, false],
      [true, false, false, false],
      [true, false, false, false],
    ];
    expect(VerificadorPatrones.hayColumna(marcadas), true); // <--- Fallará porque aún no existe
  });
  test('no detecta columna si ninguna esta completa', () {
    final marcadas = [
      [true, false, false, false],
      [true, false, false, false],
      [false, false, false, false],
      [true, false, false, false],
    ];
    expect(VerificadorPatrones.hayColumna(marcadas), false);
  });

//! RONDA 8: Detectar una diagonal ganadora
  test('detecta la diagonal principal completa', () {
    final marcadas = [
      [true, false, false, false],
      [false, true, false, false],
      [false, false, true, false],
      [false, false, false, true],
    ];
    expect(VerificadorPatrones.hayDiagonal(marcadas), true); // <--- Fallará porque aún no existe
  });

  test('detecta la diagonal secundaria completa', () {
    final marcadas = [
      [false, false, false, true],
      [false, false, true, false],
      [false, true, false, false],
      [true, false, false, false],
    ];
    expect(VerificadorPatrones.hayDiagonal(marcadas), true); // <--- Fallará porque aún no existe
  });
}