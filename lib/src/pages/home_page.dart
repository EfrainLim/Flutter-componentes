import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _items(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _items(dato, BuildContext context) {
    List<Widget> lista = <Widget>[];
    dato.forEach((opt) {
      final widtemp = ListTile(
        title: Text(opt['texto']),
        subtitle: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: getIcon(opt['icon']),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      lista.add(widtemp);
    });
    return lista;
  }
}
