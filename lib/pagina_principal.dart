import 'package:flutter/material.dart';
import 'producto_detalle.dart';
import 'chat_screen.dart';
import 'perfil.dart';
import 'subir_producto_stateful.dart';
import 'data_store.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      ).then((_) => setState(() => _selectedIndex = 0));
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PerfilScreen()),
      ).then((_) => setState(() => _selectedIndex = 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        backgroundColor: Colors.grey[200],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: DataStore.productos.isEmpty
                ? const Center(child: Text('No products available'))
                : ListView.builder(
                    itemCount: DataStore.productos.length,
                    itemBuilder: (context, index) {
                      final producto = DataStore.productos[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          // SECCIÓN DE LA IMAGEN LOCAL ACTUALIZADA
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              producto['imagen'] ?? 'assets/images/im1.png', 
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.broken_image, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                          title: Text(producto['nombreProducto']!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(producto['descripcion']!),
                              Text('@${producto['usuario']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          trailing: Text('${producto['precio']}€', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductoDetalle(
                                  usuario: producto['usuario']!,
                                  nombreProducto: producto['nombreProducto']!,
                                  descripcion: producto['descripcion']!,
                                  precio: producto['precio']!,
                                  // PASAMOS LA VARIABLE DE LA IMAGEN AL DETALLE
                                  imagen: producto['imagen'] ?? 'assets/images/im1.png',
                                ),
                              ),
                            ).then((_) => setState(() {}));
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final sePublico = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SubirProductoStateful(),
            ),
          );
          if (sePublico == true) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}