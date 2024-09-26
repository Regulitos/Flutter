import 'package:flutter/material.dart';

class Calculator extends StatefulWidget{
  const Calculator ({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  double result = 0;
  double ans = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
            Text('$result',
            style:const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
            Text("Click${result == 1 ? '': 's'}",
            style:const TextStyle(fontSize:25))
          ],        
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            result = result + 1;
          });
        },
        child: const Row( 
          mainAxisSize: MainAxisSize.min,
          children: [
          Icon(Icons.one_x_mobiledata)]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            result = result + 1;
          });
        },
        child: const Row( 
          mainAxisSize: MainAxisSize.min,
          children: const [
          Icon(Icons.one_x_mobiledata),],),
      ),
    );
  }
}