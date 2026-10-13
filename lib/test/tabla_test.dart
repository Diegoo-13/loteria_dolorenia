import 'package:flutter_test/flutter_test.dart';
import 'package:loteria_dolorenia/logic/baraja.dart';
import 'package:loteria_dolorenia/logic/tabla.dart';
import 'package:loteria_dolorenia/models/carta.dart';

//! RONDA 4: La tabla: cuadrícula de 4x4
void main() {
  test('una tabla nueva contiene las 16 cartas, sin repetir', () {
    final cartas = Baraja.crearBarajaCompleta().cartasRestantes;
    final tabla = Tabla.generar(cartas); // <--- Aquí fallará porque Tabla aún no existe
    final todas = tabla.filas.expand((fila) => fila).toList();
    expect(todas.length, 16);
    expect(todas.toSet().length, 16);
  });

  test('una tabla nueva no tiene ninguna celda marcada', () {
    final cartas = Baraja.crearBarajaCompleta().cartasRestantes;
    final tabla = Tabla.generar(cartas);
    expect(tabla.marcadas.every((fila) => fila.every((m) => m == false)), true);
  });

  //! RONDA 5: Marcar una carta en tabla
test('marcar encuentra la carta en la tabla y marca su celda', () {
    final cartas = Baraja.crearBarajaCompleta().cartasRestantes;
    final tabla = Tabla.generar(cartas);
    final cartaEnTabla = tabla.filas[0][0];
    
    tabla.marcar(cartaEnTabla); // <--- Aquí fallará porque el método aún no existe
    
    expect(tabla.marcadas[0][0], true);
  });

  test('marcar una carta que no esta en la tabla no cambia nada', () {
    final cartas = Baraja.crearBarajaCompleta().cartasRestantes;
    final tabla = Tabla.generar(cartas);
    const cartaAjena = Carta(id: 999, nombre: 'Carta inexistente');
    
    tabla.marcar(cartaAjena); // <--- Aquí fallará porque el método aún no existe
    
    expect(tabla.marcadas.every((fila) => fila.every((m) => m == false)), true);
  });
}