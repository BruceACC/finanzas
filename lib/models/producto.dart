class Producto {
  final int? id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagen;

  Producto({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagen,
  });

  // Convertir de un mapa (SQLite) a un objeto Producto
  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      precio: map['precio'],
      imagen: map['imagen'],
    );
  }

  // Convertir de un objeto Producto a un mapa (SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'imagen': imagen,
    };
  }
}
