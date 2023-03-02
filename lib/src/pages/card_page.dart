import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          cardTipo(),
          const Divider(),
          cardTipo2(),
        ],
      ),
    );
  }

  Widget cardTipo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Titulo de Card 1'),
            subtitle: Text(
                'Este es un resumen del Titulo de Card 1,si quieres mas detalles'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () {}, child: const Text('Cancelar')),
              TextButton(onPressed: () {}, child: const Text('Ok')),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardTipo2() {
    final card = Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            fit: BoxFit.cover,
            height: 300.0,
            fadeInDuration: Duration(milliseconds: 200),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'Este es el detalle de la imagen que se muestra a continuación',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black26,
            spreadRadius: 2.0,
            offset: Offset(5.0, 2.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
