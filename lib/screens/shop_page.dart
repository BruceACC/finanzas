import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  final List<Map<String, String>> productos = [
    // Periféricos
    {
      'nombre': 'Teclado Mecánico RGB',
      'precio': 'S/ 150.00',
      'descripcion': 'Teclado mecánico con iluminación RGB y switches azules.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3135/PMP00002890413/full_image-1.jpeg',
    },
    {
      'nombre': 'Mouse Gamer',
      'precio': 'S/ 100.00',
      'descripcion': 'Mouse gamer con sensor óptico de alta precisión.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/1737/PMP00001373891/full_image-1.jpeg',
    },
    {
      'nombre': 'Auriculares Gaming',
      'precio': 'S/ 200.00',
      'descripcion': 'Auriculares con sonido envolvente 7.1 y micrófono.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/4233/PMP20000138835/full_image-1.jpeg',
    },
    {
      'nombre': 'Monitor 4K',
      'precio': 'S/ 1200.00',
      'descripcion': 'Monitor 4K UHD con HDR y tasa de refresco de 120Hz.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3278/PMP20000439784/full_image-1.jpeg',
    },
    {
      'nombre': 'Silla Gamer',
      'precio': 'S/ 800.00',
      'descripcion': 'Silla ergonómica para gamers con reposabrazos ajustables.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/1471/PMP20000492857/full_image-1.jpeg',
    },

    // Accesorios
    {
      'nombre': 'Funda para Laptop',
      'precio': 'S/ 50.00',
      'descripcion': 'Funda acolchada para laptops de hasta 15.6 pulgadas.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/119/PMP00001581149/imagen2-1.jpeg',
    },
    {
      'nombre': 'Cable HDMI 4K',
      'precio': 'S/ 40.00',
      'descripcion': 'Cable HDMI compatible con resolución 4K UHD.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3278/PMP20000425154/full_image-1.jpeg',
    },
    {
      'nombre': 'Cargador Inalámbrico',
      'precio': 'S/ 120.00',
      'descripcion': 'Cargador rápido inalámbrico para smartphones.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/4933/PMP20000445854/imagen3-1.png',
    },

    // Componentes
    {
      'nombre': 'Tarjeta Gráfica RTX 3060',
      'precio': 'S/ 2500.00',
      'descripcion': 'GPU NVIDIA RTX 3060 con 12GB GDDR6.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/5056/PMP20000578139/full_image-1.webp',
    },
    {
      'nombre': 'Procesador Intel i7 12th Gen',
      'precio': 'S/ 1800.00',
      'descripcion': 'Procesador Intel Core i7 de 12ª generación.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/4321/PMP20000155765/full_image-1.jpeg',
    },
    {
      'nombre': 'Memoria RAM 16GB DDR4',
      'precio': 'S/ 400.00',
      'descripcion': 'Módulo de memoria RAM DDR4 de 16GB.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3949/PMP20000114290/imagen2-1.png',
    },
    {
      'nombre': 'SSD NVMe 1TB',
      'precio': 'S/ 600.00',
      'descripcion': 'Unidad de almacenamiento SSD NVMe de 1TB.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/2786/PMP00003079259/imagen2-1.png',
    },

    // Smartphones
    {
      'nombre': 'Smartphone Samsung Galaxy S21',
      'precio': 'S/ 3200.00',
      'descripcion': 'Smartphone con pantalla AMOLED y cámara triple.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3278/PMP20000428337/full_image-1.jpeg',
    },
    {
      'nombre': 'iPhone 13',
      'precio': 'S/ 4200.00',
      'descripcion': 'iPhone 13 con chip A15 Bionic y pantalla Super Retina.',
      'imagen': 'https://home.ripley.com.pe/Attachment/WOP_5/2065287752910/2065287752910_2.jpg',
    },
    {
      'nombre': 'Xiaomi Redmi Note 10',
      'precio': 'S/ 800.00',
      'descripcion': 'Smartphone económico con pantalla FHD+ y cámara cuádruple.',
      'imagen': 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/3985/PMP20000311960/full_image-1.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: productos.length,
          itemBuilder: (context, index) {
            final producto = productos[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.network(
                  producto['imagen']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  producto['nombre']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(producto['descripcion']!),
                    SizedBox(height: 8),
                    Text(
                      producto['precio']!,
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Seleccionaste ${producto['nombre']}')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
