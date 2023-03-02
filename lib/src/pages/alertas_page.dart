import 'package:flutter/material.dart';

class AlertaPage extends StatelessWidget {
  const AlertaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerta Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: Colors.brown,
            ),
            onPressed: () => _btnMostrar(context),
            child: const Text('Mostrar')),
      ),
    );
  }

  void _btnMostrar(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 10.0,
            title: const Text('Titulo de Alerta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('Este es un detalle de la alerta que se va mostrar '),
                FlutterLogo(
                  size: 40.0,
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok')),
            ],
          );
        });
  }
}
