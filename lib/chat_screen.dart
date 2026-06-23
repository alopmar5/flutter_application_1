import 'package:flutter/material.dart';
import 'individual_chat_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {'usuario': 'user1', 'mensaje': 'Hey there!', 'hora': '14:20'},
      {'usuario': 'user2', 'mensaje': 'How are you?', 'hora': '10:15'},
      {'usuario': 'user3', 'mensaje': 'Good morning!', 'hora': '18:30'},
      {'usuario': 'user4', 'mensaje': 'What’s up?', 'hora': '09:42'},
      {'usuario': 'user5', 'mensaje': 'See you tomorrow.', 'hora': '01:12'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 216, 87, 130),
              child: Text(chat['usuario']![0].toUpperCase()),
            ),
            title: Text('@${chat['usuario']}'),
            subtitle: Text(chat['mensaje']!),
            trailing: Text(chat['hora']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndividualChatScreen(
                    usuario: chat['usuario']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
