import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _listaNumeros = [];
  int _ultimoNumero = 0;
  bool _estaCargando = false;
  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista y Scrolls'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _lista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _lista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (context, int index) {
            final imagen = _listaNumeros[index];
            return FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 200),
            );
          }),
    );
  }

  Future _obtenerPagina1() async {
    const duracion = Duration(seconds: 2);
    Timer(duracion, () {
      _listaNumeros.clear();
      _ultimoNumero++;
      _agregar10();
    });
    return Future.delayed(duracion);
  }

  void _agregar10() {
    for (int i = 1; i < 10; i++) {
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);
      setState(() {});
    }
  }

  Future fetchData() async {
    _estaCargando = true;
    final duracion = Duration(seconds: 2);
    setState(() {});
    return Timer(duracion, respuestHttp);
  }

  void respuestHttp() {
    _estaCargando = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_estaCargando) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
