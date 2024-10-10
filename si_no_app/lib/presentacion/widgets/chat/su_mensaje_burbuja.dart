import 'package:flutter/material.dart';

class SuMensajeBurbuja extends StatelessWidget {
  const SuMensajeBurbuja({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // Toma los colores para las burbujas del tema
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // Toma el color definido en el tema, el 1, 2, 3, etc
            borderRadius: BorderRadius.circular(20), // Borde redondeado en los chats
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Mensaje Respondido", style: TextStyle(color: Colors.white)),
          ), // Padding
        ), 
        const SizedBox(height: 5),
        _ImagenBurbuja(),
        const SizedBox(height: 10),
      ], 
    );
  }
}

class _ImagenBurbuja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // El mediaQuery da información del tamaño del dispositivo que lo esta ejecutando
    return ClipRRect( // Permite hacer bordes redondeados
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/5-64c280ac40857b94fdbb3eaf32d92c.gif',
        width: size.width * 0.7, // Se deja el 70% de ancho para la imagen
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child; // Si ya cargó regresa la imagen
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Está enviando una imagen"), // Mensaje mientras carga la imagen
          );
        },
      ), 
    ); 
  }
}
