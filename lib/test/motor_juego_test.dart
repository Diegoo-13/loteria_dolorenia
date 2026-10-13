import 'package:flutter_test/flutter_test.dart';
import 'package:loteria_dolorenia/logic/baraja.dart';
import 'package:loteria_dolorenia/logic/tabla.dart';
import 'package:loteria_dolorenia/logic/motor_juego.dart';

//! RONDA 10: Motor de juego
void main() {
  test('el motor detecta Loteria al completar una fila', () {
    final cartas = Baraja.crearBarajaCompleta().cartasRestantes; 
    final baraja = Baraja.desdeCartas(cartas);
    final tabla = Tabla.desdeFilas([
      cartas.sublist(0, 4),
      cartas.sublist(4, 8),
      cartas.sublist(8, 12),
      cartas.sublist(12, 16),
    ]);
    final motor = MotorJuego(baraja: baraja, tabla: tabla);
    
    for (var i = 0; i < 4; i++) {
      motor.cantarYMarcar();
    }
    expect(motor.haGanado, true); // <--- Fallará porque MotorJuego aún no existe
  });
}