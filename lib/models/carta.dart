class Carta {
  // El número único que identifica a la carta (del 0 al 15)
  final int id;
  
  // El nombre de la carta (ej. "El Cura", "La Campana")
  final String nombre;

  // Constructor sencillito para crear nuestra carta
  const Carta({required this.id, required this.nombre});

  // Sobrescribimos el operador '==' para que dos cartas sean iguales si tienen el mismo ID.
  // Esto es clave para que cuando el juego "cante" una carta, la app sepa buscarla 
  // en la tabla sin importar si es un objeto distinto en memoria.
  @override
  bool operator ==(Object other) => other is Carta && other.id == id;

  // Obligatorio en Dart cuando sobrescribes '==': darle un código hash basado en su ID.
  @override
  int get hashCode => id.hashCode;

  // Para que, si mandamos a imprimir la carta, nos devuelva directamente su nombre de texto.
  @override
  String toString() => nombre;
}