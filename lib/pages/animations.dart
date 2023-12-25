import 'dart:math';
import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

var _color = const Color.fromARGB(255, 29, 148, 245);
double _width = 100.0;
double _height = 100.0;

class _AnimationsState extends State<Animations> {
  void _animateContainer() {
    _color = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
    _width = Random().nextInt(255).toDouble();
    _height = Random().nextInt(255).toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Column(children: [
        Expanded(
            child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
                color: _color, borderRadius: BorderRadius.circular(5)),
          ),
        )),
        FloatingActionButton(
          onPressed: _animateContainer,
          child: const Text('Animar'),
        )
      ]),
    );
  }
}
