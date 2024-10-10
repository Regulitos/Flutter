import 'package:flutter/material.dart';
import 'package:si_no_app/config/tema/app_tema.dart'; 
import 'package:si_no_app/presentacion/pantallas/chat/chat_pantalla.dart';

void main() => runApp(const MyApp());

// Este widget es la raíz de su aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTema().theme(2), // Obtenemos el tema
      home: const ChatPantalla(

      )
    ); 
  }
}
