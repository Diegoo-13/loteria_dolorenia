import 'package:flutter/material.dart';
import 'logic/baraja.dart';
import 'logic/tabla.dart';
import 'logic/motor_juego.dart';

void main() => runApp(const LoteriaApp());

class LoteriaApp extends StatelessWidget {
  const LoteriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loteria Dolorena',
      theme: ThemeData(primarySwatch: Colors.deepOrange, useMaterial3: true),
      home: const JuegoScreen(),
    );
  }
}

class JuegoScreen extends StatefulWidget {
  const JuegoScreen({super.key});

  @override
  State<JuegoScreen> createState() => _JuegoScreenState();
}

class _JuegoScreenState extends State<JuegoScreen> {
  late MotorJuego _motor;
  late Tabla _tabla;
  String _ultimaCarta = 'Toca Cantar para empezar';

  @override
  void initState() {
    super.initState();
    _reiniciar(); // Arranca una nueva partida al abrir la app
  }

  // Prepara un juego completamente nuevo barajando y limpiando tableros
  void _reiniciar() {
    final baraja = Baraja.crearBarajaCompleta()..mezclar();
    _tabla = Tabla.generar(Baraja.crearBarajaCompleta().cartasRestantes);
    _motor = MotorJuego(baraja: baraja, tabla: _tabla);
    _ultimaCarta = 'Toca Cantar para empezar';
    setState(() {});
  }

  // Lo que pasa cuando el usuario presiona el botón de cantar carta
  void _cantar() {
    final carta = _motor.cantarYMarcar();
    setState(() => _ultimaCarta = carta?.nombre ?? 'Ya no quedan cartas');
    
    // Si el motor dice que ya ganamos, lanzamos una ventanita de alerta (Dialog)
    if (_motor.haGanado) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('¡Loteria!'),
          content: const Text('Completaste una linea, columna o diagonal.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _reiniciar(); // Vuelve a empezar al cerrar la alerta
              },
              child: const Text('Jugar de nuevo'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loteria Dolorena')),
      body: Column(
        children: [
          // Texto superior que muestra la última carta que salió cantada
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(_ultimaCarta, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          // Cuadrícula visual de 4x4 pintando de naranja las celdas que ya cayeron
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: 16,
              itemBuilder: (context, i) {
                final f = i ~/ 4;
                final col = i % 4;
                final carta = _tabla.filas[f][col];
                final marcada = _tabla.marcadas[f][col];
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: marcada ? Colors.deepOrange : Colors.orange.shade50,
                    border: Border.all(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      carta.nombre,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, color: marcada ? Colors.white : Colors.black87),
                    ),
                  ),
                );
              },
            ),
          ),
          // Botón inferior para cantar la siguiente carta
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: _cantar,
              icon: const Icon(Icons.campaign),
              label: const Text('Cantar siguiente carta'),
            ),
          ),
        ],
      ),
    );
  }
}