import 'package:flutter/material.dart';
import 'data_store.dart';
import 'individual_chat_screen.dart';

class ProductoDetalle extends StatelessWidget {
  final String usuario;
  final String nombreProducto;
  final String descripcion;
  final String precio;
  final String imagen; // PROPIEDAD AÑADIDA PARA RECIBIR LA RUTA

  const ProductoDetalle({
    super.key,
    required this.usuario,
    required this.nombreProducto,
    required this.descripcion,
    required this.precio,
    required this.imagen, // REQUISITO DEL CONSTRUCTOR AÑADIDO
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.red),
            onPressed: () {
              DataStore.misFavoritos.add({
                'nombre': nombreProducto,
                'precio': precio,
                'imagen': imagen,
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('"$nombreProducto" added to Favorites!')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SECCIÓN DE LA IMAGEN EN GRANDE ACTUALIZADA
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagen, 
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('@$usuario', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualChatScreen(usuario: usuario),
                      ),
                    );
                  },
                  child: const Text('Chat'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              nombreProducto,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '$precio€',
              style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                DataStore.misCompras.add({
                  'nombre': nombreProducto,
                  'precio': precio,
                  'imagen': imagen,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Purchase completed! Check your profile.')),
                );
              },
              child: const Text('Buy Now', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}