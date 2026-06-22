import 'package:flutter/material.dart';

class ProductoDetalle extends StatelessWidget {
  final String usuario;
  final String nombreProducto;
  final String descripcion;
  final String precio;

  const ProductoDetalle({
    super.key,
    required this.usuario,
    required this.nombreProducto,
    required this.descripcion,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('@$usuario', style: const TextStyle(fontSize: 16)),
                ElevatedButton(
                  onPressed: () {
                    // Logic to open a chat
                  },
                  child: const Text('Chat'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              nombreProducto,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '$precio€',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Logic to complete the purchase
              },
              child: const Text('Buy'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
