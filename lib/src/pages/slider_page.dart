import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorScroll = 30;
  bool _valorCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Page'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _crearSlider(),
              _crearCheckbox(),
              _crearSwith(),
              Expanded(child: _crearImagen()),
            ],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
      label: 'desliza',
      min: 1.0,
      max: 400.0,
      value: _valorScroll,
      onChanged: (_valorCheck)
          ? null
          : (scroll) {
              setState(() {
                _valorScroll = scroll;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      width: _valorScroll,
      image: const NetworkImage(
        'https://www.pngall.com/wp-content/uploads/2016/06/Earth-PNG.png',
      ),
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: const Text('Selecciona la Opcion'),
      value: _valorCheck,
      onChanged: (value) {
        setState(() {
          _valorCheck = value!;
        });
      },
    );
  }

  Widget _crearSwith() {
    return SwitchListTile(
      title: const Text('Selecciona la Opcion'),
      value: _valorCheck,
      onChanged: (value) {
        setState(() {
          _valorCheck = value;
        });
      },
    );
  }
}
