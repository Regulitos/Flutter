import 'package:flutter/material.dart';
import 'package:si_no_app/config/tema/app_tema.dart'; // Importamos el tema

void main() => runApp(const MyApp());

// Este widget es la raíz de su aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTema().theme(), // Obtenemos el tema
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Barra de la aplicación'),
        ),
        body: Center(
          child: FilledButton.tonal( // Botón relleno con color
            onPressed: () {},
            child: const Text('Clic me'),
          ), // FilledButton.tonal
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}
