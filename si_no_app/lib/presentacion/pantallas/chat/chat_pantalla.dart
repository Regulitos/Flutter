import 'package:flutter/material.dart';
import 'package:si_no_app/presentacion/widgets/chat/mi_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/chat/su_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/compartido/caja_de_texto.dart';

class ChatPantalla extends StatelessWidget {
  const ChatPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding( // El leading es un espacio que se tiene antes del título
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: // Escoger la URL de cualquier imagen en internet
              NetworkImage('https://img.freepik.com/free-vector/twitter-app-new-logo-x-black-background_1017-45425.jpg'),
          ), 
        ), 
        title: const Text("Emilia"),
        centerTitle: false,
      ), 
      body: _ChatView(),
    ); 
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column( // La columna sirve para colocar un widget debajo de otro
          children: [
            Expanded( // Expanded permite expandir todo el widget hijo a todo el espacio disponible que el padre le dé
              child: ListView.builder(
                itemCount: 10, // Solo permite 10 elementos
                itemBuilder: (context, index) {
                  return index % 2 == 0 // Si es un número par mostrar su mensaje, si no el mío
                    ? const SuMensajeBurbuja()
                    : const MiMensajeBurbuja();
                },
              ), // ListView.builder
            ), // Expanded
            const CajadeTexto(), // Caja de Texto
          ], // children
        ), // Column
      ), // Padding
    ); // SafeArea
  }
}
