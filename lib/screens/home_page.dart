import 'package:flutter/material.dart';
import 'user_profile_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> productos = [
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
  ];

  final String userImage =
      'https://via.placeholder.com/150'; // Imagen del usuario (puedes cambiarla dinámicamente)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InnovaTech'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              // Redirigir a la página de configuración de perfil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userImage),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Periféricos',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '¡Los mejores descuentos!',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(producto['imagen']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          producto['nombre']!,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          producto['precio']!,
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
