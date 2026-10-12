import '../models/carta.dart';
import 'baraja.dart';
import 'tabla.dart';
import 'verificador_patrones.dart';

class MotorJuego {
  final Baraja baraja;
  final Tabla tabla;
  bool haGanado = false; // Bandera para saber si ya cantamos victoria

  MotorJuego({required this.baraja, required this.tabla});

  // El corazoncito de cada turno: canta una carta, la marca en la tabla y checa si ya ganamos
  Carta? cantarYMarcar() {
    final carta = baraja.cantarSiguiente();
    if (carta == null) return null; // Si ya no hay cartas, no hace nada

    tabla.marcar(carta); // Intenta marcarla en la tabla del usuario

    // Si con esta marca se completa un patrón ganador, activamos la victoria
    if (VerificadorPatrones.hayGanador(tabla.marcadas)) {
      haGanado = true;
    }
    return carta;
  }
}