import 'package:flutter/material.dart';

class DetalleProductoPage extends StatelessWidget {
  final Map<String, dynamic> producto;
  final Function(Map<String, dynamic>) onAgregarAlCarrito;

  DetalleProductoPage({
    required this.producto,
    required this.onAgregarAlCarrito,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto['nombre']),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(producto['imagen']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              producto['nombre'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Precio: S/${producto['precio']}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              producto['descripcion'],
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                onAgregarAlCarrito({
                  'nombre': producto['nombre'],
                  'precio': producto['precio'],
                  'cantidad': 1,
                  'imagen': producto['imagen'],
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${producto['nombre']} agregado al carrito')),
                );
                Navigator.pop(context);
              },
              child: Text('Agregar al Carrito'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
