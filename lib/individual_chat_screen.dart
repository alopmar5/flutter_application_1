import 'package:flutter/material.dart';

class IndividualChatScreen extends StatefulWidget {
  final String usuario;

  const IndividualChatScreen({super.key, required this.usuario});

  @override
  State<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  final List<Map<String, String>> mensajes = [
    {'mensaje': 'Hello, how are you?', 'hora': '15:53', 'esMio': 'false', 'fecha': 'Tuesday'},
    {'mensaje': 'Good, and you?', 'hora': '16:00', 'esMio': 'true', 'fecha': 'Tuesday'},
    {'mensaje': 'Everything is fine, thanks.', 'hora': '16:13', 'esMio': 'false', 'fecha': 'Tuesday'},
    {'mensaje': 'Great.', 'hora': '16:13', 'esMio': 'true', 'fecha': 'Tuesday'},
    {'mensaje': 'See you tomorrow?', 'hora': '13:57', 'esMio': 'false', 'fecha': 'Today'},
  ];

  final TextEditingController mensajeController = TextEditingController();

  void enviarMensaje() {
    final texto = mensajeController.text;
    if (texto.isNotEmpty) {
      setState(() {
        mensajes.add({
          'mensaje': texto,
          'hora': TimeOfDay.now().format(context),
          'esMio': 'true',
          'fecha': 'Today',
        });
      });
      mensajeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(widget.usuario[0].toUpperCase()),
            ),
            const SizedBox(width: 10),
            Text('@${widget.usuario}'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mensajes.length,
              itemBuilder: (context, index) {
                final mensaje = mensajes[index];
                final esMio = mensaje['esMio'] == 'true';

                bool showDate = index == 0 ||
                    mensajes[index]['fecha'] != mensajes[index - 1]['fecha'];

                return Column(
                  crossAxisAlignment:
                      esMio ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    if (showDate)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            mensaje['fecha']!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: esMio ? Colors.blue[100] : Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          bottomLeft: esMio
                              ? const Radius.circular(10)
                              : const Radius.circular(0),
                          bottomRight: esMio
                              ? const Radius.circular(0)
                              : const Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mensaje['mensaje']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              mensaje['hora']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: mensajeController,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: enviarMensaje,
                  icon: const Icon(Icons.send),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
