import 'package:flutter/material.dart';

class TempHome extends StatelessWidget {
  TempHome({super.key});
  final opciones = ['uno', 'dos', 'tres', 'cuatro'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview'),
        centerTitle: true,
      ),
      body: ListView(
        children: _itemsCorta(),
      ),
    );
  }

  List<Widget> _itemsCorta() {
    return opciones.map((opt) {
      return ListTile(
        title: Text(opt),
        subtitle: Text(opt),
        leading: const Icon(Icons.baby_changing_station),
        trailing: const Icon(Icons.baby_changing_station),
        onTap: () {},
      );
    }).toList();
  }
}
