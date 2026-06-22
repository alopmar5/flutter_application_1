import 'package:flutter/material.dart';
import 'login.dart';
import 'registro.dart';
import 'pagina_principal.dart';
import 'perfil.dart';
import 'chat_screen.dart';
import 'subir_producto_stateless.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/registro': (context) => const Registro(),
        '/pagina_principal': (context) => const PaginaPrincipal(),
        '/perfil': (context) => const PerfilScreen(),
        '/chats': (context) => const ChatScreen(),
        '/subir_producto': (context) => SubirProductoStateless(
          productos: [],
          onProductoSubido: (nuevoProducto) {
            // Handle uploaded product if needed
          },
        ),
      },
    );
  }
}
