import '../models/carta.dart';

class Baraja {
  // La lista con las cartas que todavía no han salido
  final List<Carta> cartasRestantes;

  // Constructor privado para controlar cómo se crea la baraja
  Baraja._(this.cartasRestantes);

  // Constructor útil (una "costura" para las pruebas) que nos deja meter un orden exacto de cartas sin mezclar
  Baraja.desdeCartas(List<Carta> cartas) : cartasRestantes = List<Carta>.from(cartas);

  // Los 16 nombres oficiales de nuestra lotería patriótica
  static const List<String> _nombres = [
    'El Cura', 'La Campana', 'El Grito', 'La Parroquia',
    'El Sarape', 'La Nieve', 'El Sombrero', 'La Guitarra',
    'El Caballo', 'La Bandera', 'El Insurgente', 'La Plaza',
    'El Fuego', 'La Estrella', 'El Aguila', 'El Tambor',
  ];

  // Crea la baraja completa ordenadita del 0 al 15 con sus nombres
  static Baraja crearBarajaCompleta() {
    final cartas = <Carta>[];
    for (var i = 0; i < _nombres.length; i++) {
      cartas.add(Carta(id: i, nombre: _nombres[i]));
    }
    return Baraja.desdeCartas(cartas);
  }

  // Baraja o revuelve las cartas al azar
  void mezclar() => cartasRestantes.shuffle();

  // "Canta" la siguiente carta: saca la última carta de la lista. 
  // Usar removeLast() es eficiente porque no pone a la lista a mover de posición a todos los demás elementos.
  Carta? cantarSiguiente() {
    if (cartasRestantes.isEmpty) return null; // Si ya se acabaron, regresa null
    return cartasRestantes.removeLast();
  }
}