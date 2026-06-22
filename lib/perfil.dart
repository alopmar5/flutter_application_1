import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  int _selectedTab = 0;

  final List<Map<String, String>> items = [
    {'nombre': 'Product Name', 'precio': '10'},
    {'nombre': 'Product Name', 'precio': '8'},
    {'nombre': 'Product Name', 'precio': '20'},
    {'nombre': 'Product Name', 'precio': '34'},
    {'nombre': 'Product Name', 'precio': '12.5'},
  ];

  final List<Map<String, String>> favorites = [];
  final List<Map<String, String>> purchases = [];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> currentContent;

    if (_selectedTab == 0) {
      currentContent = items;
    } else if (_selectedTab == 1) {
      currentContent = favorites;
    } else {
      currentContent = purchases;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
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
                const Text(
                  'Full Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '@username',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => setState(() => _selectedTab = 0),
                child: Column(
                  children: [
                    Text(
                      'Items',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _selectedTab == 0 ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (_selectedTab == 0)
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.black,
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _selectedTab = 1),
                child: Column(
                  children: [
                    Text(
                      'Favorites',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _selectedTab == 1 ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (_selectedTab == 1)
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.black,
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _selectedTab = 2),
                child: Column(
                  children: [
                    Text(
                      'Purchased',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _selectedTab == 2 ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (_selectedTab == 2)
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.black,
                      ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: currentContent.length + (_selectedTab == 0 ? 1 : 0),
              itemBuilder: (context, index) {
                if (_selectedTab == 0 && index == currentContent.length) {
                  return GestureDetector(
                    onTap: () {
                      // Logic to add a new item
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: const Center(
                        child: Icon(Icons.add, size: 30, color: Colors.grey),
                      ),
                    ),
                  );
                }
                final producto = currentContent[index];
                return Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      producto['nombre']!,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${producto['precio']}€',
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/pagina_principal');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/chats');
          }
        },
      ),
    );
  }
}
