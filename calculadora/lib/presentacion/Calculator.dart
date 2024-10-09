import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';
  String _output = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '';
        _output = '';
      } else if (buttonText == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(_input);
          ContextModel cm = ContextModel();
          _output = exp.evaluate(EvaluationType.REAL, cm).toStringAsFixed(2);
        } catch (e) {
          _output = 'Error';
        }
      } else {
        _input += buttonText;
      }
    });
  }

  Widget _buildButton(String buttonText, {Color color = Colors.blue}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // Cambiado de 'primary' a 'backgroundColor'
            padding: EdgeInsets.all(20),
          ),
          onPressed: () => _onButtonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _input,
                    style: TextStyle(fontSize: 32, fontFamily: 'RobotoMono'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _output,
                    style: TextStyle(fontSize: 48, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  Expanded(child: Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('/', color: Colors.orange)])),
                  Expanded(child: Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('*', color: Colors.orange)])),
                  Expanded(child: Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-', color: Colors.orange)])),
                  Expanded(child: Row(children: [_buildButton('C', color: Colors.red), _buildButton('0'), _buildButton('=', color: Colors.green), _buildButton('+', color: Colors.orange)])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}