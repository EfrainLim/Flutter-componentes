import 'dart:math';

import 'package:flutter/material.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({super.key});

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  double _with = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(10.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: _with,
          height: _heigth,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiar,
        child: const Icon(Icons.document_scanner),
      ),
    );
  }

  void _cambiar() {
    final random = Random();
    setState(() {
      _with = random.nextInt(400).toDouble();
      _heigth = random.nextInt(400).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 2);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
