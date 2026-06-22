import 'package:flutter/material.dart';
import 'producto_detalle.dart';
import 'chat_screen.dart';
import 'perfil.dart';
import 'subir_producto_stateless.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _selectedIndex = 0;

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
    {
      'usuario': 'user4',
      'nombreProducto': 'Product 4',
      'descripcion': 'Description for product 4',
      'precio': '10.5'
    },
    {
      'usuario': 'user5',
      'nombreProducto': 'Product 5',
      'descripcion': 'Description for product 5',
      'precio': '22'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PerfilScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        backgroundColor: Colors.grey[800],
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
            child: ListView.builder(
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(producto['descripcion']!),
                        Text('@${producto['usuario']}'),
                      ],
                    ),
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
        },
        child: const Icon(Icons.add),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}