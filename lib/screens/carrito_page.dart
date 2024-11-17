import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget {
  final List<Map<String, dynamic>> carrito;

  CarritoPage({required this.carrito});

  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  double _calcularTotal() {
    double total = 0;
    for (var producto in widget.carrito) {
      total += producto['precio'] * producto['cantidad'];
    }
    return total;
  }

  void _eliminarProducto(int index) {
    setState(() {
      widget.carrito.removeAt(index);
    });
  }

  void _modificarCantidad(int index, int nuevaCantidad) {
    setState(() {
      if (nuevaCantidad > 0) {
        widget.carrito[index]['cantidad'] = nuevaCantidad;
      } else {
        widget.carrito.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: widget.carrito.isEmpty
                  ? Center(
                child: Text(
                  'El carrito está vacío.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: widget.carrito.length,
                itemBuilder: (context, index) {
                  final producto = widget.carrito[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        producto['imagen'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(producto['nombre']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Precio: S/${producto['precio']}'),
                          Text('Cantidad: ${producto['cantidad']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              _modificarCantidad(
                                index,
                                producto['cantidad'] - 1,
                              );
                            },
                          ),
                          Text('${producto['cantidad']}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _modificarCantidad(
                                index,
                                producto['cantidad'] + 1,
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _eliminarProducto(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            widget.carrito.isEmpty
                ? SizedBox.shrink()
                : Column(
              children: [
                Text(
                  'Total: S/${_calcularTotal().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes navegar a la pantalla de pago
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Procediendo al pago...')),
                    );
                  },
                  child: Text('Proceder al Pago'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
