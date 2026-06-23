import 'package:flutter/material.dart';
import 'data_store.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  int _selectedTab = 0;

  // REQUERIMIENTO 3: Función para abrir diálogo y actualizar datos en tiempo real
  void _editarPerfil() {
    final nameController = TextEditingController(text: DataStore.usuarioLogueado['nombreCompleto']);
    final userController = TextEditingController(text: DataStore.usuarioLogueado['usuario']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                DataStore.usuarioLogueado['nombreCompleto'] = nameController.text;
                DataStore.usuarioLogueado['usuario'] = userController.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // REQUERIMIENTO 1: Filtramos los productos globales que pertenezcan al usuario logueado actual
    final List<Map<String, String>> misProductos = DataStore.productos
        .where((p) => p['usuario'] == DataStore.usuarioLogueado['usuario'])
        .map((p) => {'nombre': p['nombreProducto']!, 'precio': p['precio']!})
        .toList();

    List<Map<String, String>> currentContent;

    if (_selectedTab == 0) {
      currentContent = misProductos;
    } else if (_selectedTab == 1) {
      currentContent = DataStore.misFavoritos;
    } else {
      currentContent = DataStore.misCompras;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editarPerfil,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DataStore.usuarioLogueado['nombreCompleto']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '@${DataStore.usuarioLogueado['usuario']}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Divider(),
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabItem('Items', 0),
              _buildTabItem('Favorites', 1),
              _buildTabItem('Purchased', 2),
            ],
          ),
          const Divider(),
          // Vista de Grilla
          Expanded(
            child: currentContent.isEmpty
                ? const Center(child: Text('No items here yet.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: currentContent.length,
                    itemBuilder: (context, index) {
                      final producto = currentContent[index];
                      return Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                color: Colors.grey[300],
                                child: const Icon(Icons.image, size: 30),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                producto['nombre']!,
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${producto['precio']}€',
                                style: const TextStyle(fontSize: 12, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              height: 2,
              width: 50,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}