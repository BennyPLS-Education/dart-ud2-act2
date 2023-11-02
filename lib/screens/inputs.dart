import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  final TextEditingController _inputFieldDataController = TextEditingController();
  final List<String> _countries = ['Andorra','Anglaterra','Dinamarca','Espanya','França'];
  String _nom = '';
  String _email = '';
  String _data = '';
  String _pais = 'Andorra';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearData(context),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counter: Text('Lletres ${_nom.length}'),
          hintText: 'Nom de l\'usuari',
          labelText: 'Nom',
          helperText: 'Posi el nom coomplet',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nom = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Correu electrònic',
          labelText: 'Correu electrònic',
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: const Icon(Icons.lock_open),
          icon: const Icon(Icons.lock)),
      onChanged: (valor) {
        // setState(() {
        //   _nom = valor;
        // });
      },
    );
  }

  Widget _crearData(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Data naixement',
          labelText: 'Data naixement',
          suffixIcon: const Icon(Icons.perm_contact_calendar),
          icon: const Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _seleccionaData(context);
      },
    );
  }

  void _seleccionaData(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        locale: const Locale('es', 'ES'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    if (picked != null) {
      setState(() {
        _data = picked.toString();
        _inputFieldDataController.text = _data;
      });
    }
  }

  _crearDropdown() {
    return  Row(
      children: [
        const Icon(Icons.language),
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            // hint: Text('Seleccioni pais'),
            value: _pais,
            items: getOptionDropdown(),
            onChanged: (opcio){
              // print(opcio);
              setState(() {
                _pais = opcio as String;
              });
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOptionDropdown() {
    List<DropdownMenuItem<String>> llista = [];
    _countries.forEach((pais) {
      llista.add(DropdownMenuItem(
        child: Text(pais),
        value: pais,
      ));
    });

    return llista;
  }

  Widget _crearPersona(){
    return ListTile(
        title: Text('Nom: $_nom'),
        subtitle: Text('Correu: $_email'),
        trailing: Text(_pais)
    );
  }
}
