import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class GestionFacturasPage extends StatefulWidget {
  @override
  _GestionFacturasPageState createState() => _GestionFacturasPageState();
}

class _GestionFacturasPageState extends State<GestionFacturasPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _facturas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarFacturas();
  }

  Future<void> _cargarFacturas() async {
    try {
      final facturas = await _dbHelper.getFacturas();
      setState(() {
        _facturas = facturas;
        _isLoading = false;
      });
    } catch (e) {
      print('Error al cargar las facturas: $e');
    }
  }

  void _verDetallesFactura(Map<String, dynamic> factura) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleFacturaPage(factura: factura),
      ),
    );
  }

  void _eliminarFactura(int id) async {
    try {
      await _dbHelper.deleteFactura(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Factura eliminada con éxito')),
      );
      _cargarFacturas();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar la factura')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Facturas'),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _facturas.isEmpty
          ? Center(
        child: Text(
          'No hay facturas disponibles.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: _facturas.length,
        itemBuilder: (context, index) {
          final factura = _facturas[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text('Factura ID: ${factura['id']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cliente ID: ${factura['cliente_id']}'),
                  Text('Total: S/${factura['total']}'),
                  Text('Fecha: ${factura['fecha']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      _verDetallesFactura(factura);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _eliminarFactura(factura['id']);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetalleFacturaPage extends StatelessWidget {
  final Map<String, dynamic> factura;

  DetalleFacturaPage({required this.factura});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Factura ID: ${factura['id']}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Factura ID: ${factura['id']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Cliente ID: ${factura['cliente_id']}',
                style: TextStyle(fontSize: 16)),
            Text('Total: S/${factura['total']}',
                style: TextStyle(fontSize: 16, color: Colors.green)),
            Text('Fecha: ${factura['fecha']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Artículos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: DatabaseHelper().getDetalleFactura(factura['id']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error al cargar los detalles de la factura.'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No hay detalles para esta factura.'),
                    );
                  } else {
                    final detalles = snapshot.data!;
                    return ListView.builder(
                      itemCount: detalles.length,
                      itemBuilder: (context, index) {
                        final detalle = detalles[index];
                        return ListTile(
                          title: Text('Producto ID: ${detalle['producto_id']}'),
                          subtitle: Text(
                              'Cantidad: ${detalle['cantidad']} - Precio: S/${detalle['precio_unitario']}'),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
