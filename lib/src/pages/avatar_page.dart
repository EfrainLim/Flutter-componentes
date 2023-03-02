import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text('EL'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
          ),
        ],
        title: const Text('Avatar Page'),
        centerTitle: true,
      ),
      body: const Center(
          child: FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(
            'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        fit: BoxFit.cover,
        height: 300.0,
        fadeInDuration: Duration(milliseconds: 200),
      )),
    );
  }
}
