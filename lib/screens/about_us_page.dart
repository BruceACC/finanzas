import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sobre Nosotros',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'InnovaTech es una plataforma dedicada a la tecnología, '
                  'ofreciendo productos de alta calidad con descuentos exclusivos.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Equipo de Desarrollo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '- Bruce Andres Cipriano Chumbes\n'
                  '- Jose Raul Chirito Torres\n'
                  '- Anthony Brahan Loarte Matos\n'
                  '- Alberto Alonso Quiñones Choroco\n'
                  '- Bryan Stevens Vilcapuma Calderon',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
