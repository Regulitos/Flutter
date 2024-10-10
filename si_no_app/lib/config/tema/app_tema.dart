import 'package:flutter/material.dart';

const Color _colorPersonalizado = Color(0xFFf41949); // Colores personalizados en hexadecimal

const List<Color> _colorTema = [ // Arreglo para establecer una serie de colores para la aplicación
  _colorPersonalizado, // Posición 0
  Colors.blue, // Posición 1
  Colors.teal, // Posición 2
  Colors.green, // Posición 3
  Colors.yellow, // Posición 4
  Colors.orange, // Posición 5
  Colors.pink, // Posición 6
];

class AppTema{ // Nombre de la clase que va a exportar
  ThemeData theme(dynamic selected) { // Método que va a regresar algo de tipo ThemeData, que será lo que reciba el Theme en el Main

    
    return ThemeData(
      useMaterial3: true, // Utilizar colores por defecto de Material 3
      colorSchemeSeed: _colorTema[selected], // Si se coloca una posición mayor a 6 se desbordaría el arreglo
      // brightness: Brightness.dark // Si se quiere poner el tema en modo oscuro
    );
  }
}
