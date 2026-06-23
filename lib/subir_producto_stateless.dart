import 'package:flutter/material.dart';

class SubirProductoStateless extends StatelessWidget {
  final List<Map<String, String>> productos;
  final Function(Map<String, String>) onProductoSubido;

  const SubirProductoStateless({
    super.key,
    required this.productos,
    required this.onProductoSubido,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController descripcionController = TextEditingController();
    final TextEditingController precioController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Product'),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(Icons.camera_alt, size: 50),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descripcionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: precioController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                DropdownButtonFormField<String>(
                  items: ['EUR', 'USD', 'MXN']
                      .map((currency) => DropdownMenuItem(
                            value: currency,
                            child: Text(currency),
                          ))
                      .toList(),
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'Currency',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final nuevoProducto = {
                  'usuario': 'currentUser',
                  'nombreProducto': nombreController.text,
                  'descripcion': descripcionController.text,
                  'precio': precioController.text,
                };

                onProductoSubido(nuevoProducto);
                Navigator.pop(context);
              },
              child: const Text('Publish'),
            ),
          ],
        ),
      ),
    );
  }
}
