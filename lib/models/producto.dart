class Producto  {
  final int? id;
  final String nombre;
  final double precio;
  final String descripcion;
  final String imagen;
  final bool descuento;

  Producto({
    this.id,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.imagen,
    this.descuento = false, // Por defecto, no tiene descuento
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
  final List<Map<String, dynamic>> productos = [
    // Periféricos
    {
      'nombre': 'Teclado Mecánico RGB',
      'precio': 150.00,
      'descripcion': 'Teclado mecánico con iluminación RGB y switches azules.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3135/PMP00002890413/full_image-1.jpeg',
      'descuento': 20, // 20% de descuento
      'precioConDescuento': 150.00 * 0.8,
    },
    {
      'nombre': 'Mouse Gamer',
      'precio': 100.00,
      'descripcion': 'Mouse gamer con sensor óptico de alta precisión.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/1737/PMP00001373891/full_image-1.jpeg',
      'descuento': 0, // Sin descuento
      'precioConDescuento': 100.00,
    },
    {
      'nombre': 'Auriculares Gaming',
      'precio': 200.00,
      'descripcion': 'Auriculares con sonido envolvente 7.1 y micrófono.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/4233/PMP20000138835/full_image-1.jpeg',
      'descuento': 15, // 15% de descuento
      'precioConDescuento': 200.00 * 0.85,
    },
    {
      'nombre': 'Monitor 4K',
      'precio': 1200.00,
      'descripcion': 'Monitor 4K UHD con HDR y tasa de refresco de 120Hz.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3278/PMP20000439784/full_image-1.jpeg',
    },
    {
      'nombre': 'Silla Gamer',
      'precio': 800.00,
      'descripcion': 'Silla ergonómica para gamers con reposabrazos ajustables.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/1471/PMP20000492857/full_image-1.jpeg',
    },

    // Accesorios
    {
      'nombre': 'Funda para Laptop',
      'precio': 50.00,
      'descripcion': 'Funda acolchada para laptops de hasta 15.6 pulgadas.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/119/PMP00001581149/imagen2-1.jpeg',
    },
    {
      'nombre': 'Cable HDMI 4K',
      'precio': 40.00,
      'descripcion': 'Cable HDMI compatible con resolución 4K UHD.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3278/PMP20000425154/full_image-1.jpeg',
    },
    {
      'nombre': 'Cargador Inalámbrico',
      'precio': 120.00,
      'descripcion': 'Cargador rápido inalámbrico para smartphones.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/4933/PMP20000445854/imagen3-1.png',
    },

    // Componentes
    {
      'nombre': 'Tarjeta Gráfica RTX 3060',
      'precio': 2500.00,
      'descripcion': 'GPU NVIDIA RTX 3060 con 12GB GDDR6.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/5056/PMP20000578139/full_image-1.webp',
    },
    {
      'nombre': 'Procesador Intel i7 12th Gen',
      'precio': 1800.00,
      'descripcion': 'Procesador Intel Core i7 de 12ª generación.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/4321/PMP20000155765/full_image-1.jpeg',
    },
    {
      'nombre': 'Memoria RAM 16GB DDR4',
      'precio': 400.00,
      'descripcion': 'Módulo de memoria RAM DDR4 de 16GB.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3949/PMP20000114290/imagen2-1.png',
    },
    {
      'nombre': 'SSD NVMe 1TB',
      'precio': 600.00,
      'descripcion': 'Unidad de almacenamiento SSD NVMe de 1TB.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/2786/PMP00003079259/imagen2-1.png',
    },

    // Smartphones
    {
      'nombre': 'Smartphone Samsung Galaxy S21',
      'precio': 3200.00,
      'descripcion': 'Smartphone con pantalla AMOLED y cámara triple.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3278/PMP20000428337/full_image-1.jpeg',
    },
    {
      'nombre': 'iPhone 13',
      'precio': 4200.00,
      'descripcion': 'iPhone 13 con chip A15 Bionic y pantalla Super Retina.',
      'imagen': 'https://home.ripley.com.pe/Attachment/WOP_5/2065287752910/2065287752910_2.jpg',
    },
    {
      'nombre': 'Xiaomi Redmi Note 10',
      'precio': 800.00,
      'descripcion': 'Smartphone económico con pantalla FHD+ y cámara cuádruple.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3985/PMP20000311960/full_image-1.jpeg',
    },
  ];

}
