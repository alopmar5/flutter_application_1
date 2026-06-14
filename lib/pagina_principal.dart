import 'package:flutter/material.dart';
import 'producto_detalle.dart';
import 'subir_producto_stateless.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final List<Map<String, String>> productos = [
    {
      'usuario': 'user1',
      'nombreProducto': 'Product 1',
      'descripcion': 'Description for product 1',
      'precio': '20'
    },
    {
      'usuario': 'user2',
      'nombreProducto': 'Product 2',
      'descripcion': 'Description for product 2',
      'precio': '15'
    },
    {
      'usuario': 'user3',
      'nombreProducto': 'Product 3',
      'descripcion': 'Description for product 3',
      'precio': '30'
    },
  ];

  void _openUploadProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubirProductoStateless(
          productos: productos,
          onProductoSubido: (nuevoProducto) {
            setState(() {
              productos.add(nuevoProducto);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page V2'),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                color: Colors.grey[300],
                child: const Icon(Icons.image),
              ),
              title: Text(producto['nombreProducto']!),
              subtitle: Text(producto['descripcion']!),
              trailing: Text('${producto['precio']}€'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductoDetalle(
                      usuario: producto['usuario']!,
                      nombreProducto: producto['nombreProducto']!,
                      descripcion: producto['descripcion']!,
                      precio: producto['precio']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openUploadProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
