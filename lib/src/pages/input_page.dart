import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  final TextEditingController _editingController = TextEditingController();
  final List<String> _poderes = ['fuerte', 'grande', 'Fuego', 'agua', 'fuerza'];
  String _opcionSeleccionada = 'Fuego';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPasword(),
          const Divider(),
          _crearFecha(),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        labelText: 'Nombres',
        hintText: 'Nombres',
        helperText: 'Solo Nombres',
        suffixIcon: const Icon(Icons.people),
        icon: const Icon(Icons.people),
        counter: Text('Letras ${_nombre.length}'),
      ),
      onChanged: (val) {
        setState(() {
          _nombre = val;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombres: $_nombre'),
      subtitle: Text('Email:$_email '),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        labelText: 'Email',
        hintText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      onChanged: (val) {
        setState(() {
          _email = val;
        });
      },
    );
  }

  Widget _crearPasword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        labelText: 'Password',
        hintText: 'Password',
        suffixIcon: const Icon(Icons.lock),
        icon: const Icon(Icons.password),
      ),
    );
  }

  Widget _crearFecha() {
    return TextField(
      controller: _editingController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        labelText: 'Fecha',
        hintText: 'Fecha',
        suffixIcon: const Icon(Icons.calendar_month),
        icon: const Icon(Icons.calendar_view_day),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectFecha(context);
      },
    );
  }

  void _selectFecha(BuildContext context) async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
      locale: const Locale('es'),
    );
    if (picker != null) {
      _fecha = picker.toString();
      _editingController.text = _fecha;
    }
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getListDropdown(),
          onChanged: (value) {
            setState(() {
              _opcionSeleccionada = value!;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getListDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
    }
    return lista;
  }
}
