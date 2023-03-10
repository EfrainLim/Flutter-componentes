import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class MenuProvider {
  List opciones = [];
  MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final respuesta = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(respuesta);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = MenuProvider();
