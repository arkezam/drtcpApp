import 'package:flutter/material.dart';

class ActaControlForm extends StatefulWidget {
  @override
  _ActaControlFormState createState() => _ActaControlFormState();
}

class _ActaControlFormState extends State<ActaControlForm> {
  final _formKey = GlobalKey<FormState>();
  final _agentOptions = ['Transportista', 'Operador Terminal', 'Conductor'];
  final _date = DateTime.now();

  String? _selectedAgent;
  String? _interventionPlace;
  String? _nameOrBusiness;
  String? _vehiclePlate;
  String? _dni;
  String? _route;
  String? _driverName;
  String? _license;
  String? _inspectorName;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Send form data to server or perform some action
      print('Form submitted!');
      print('Selected agent: $_selectedAgent');
      print('Intervention place: $_interventionPlace');
      print('Name or business: $_nameOrBusiness');
      print('Vehicle plate: $_vehiclePlate');
      print('DNI: $_dni');
      print('Route: $_route');
      print('Driver name: $_driverName');
      print('License: $_license');
      print('Inspector name: $_inspectorName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acta de Control'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agent infractor:',
                  style: TextStyle(fontSize: 16.0),
                ),
                DropdownButtonFormField<String>(
                  items: _agentOptions.map((agent) {
                    return DropdownMenuItem<String>(
                      value: agent,
                      child: Text(agent),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedAgent = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor seleccione un agente infractor';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Fecha:',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '${_date.day}/${_date.month}/${_date.year}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Lugar de intervencion',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un lugar de intervención';
                    }
                    return null;
                  },
                  onSaved: (value) => _interventionPlace = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre o razon social',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un nombre o razón social';
                    }
                    return null;
                  },
                  onSaved: (value) => _nameOrBusiness = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Placa de vehiculo',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una placade vehículo';
                    }
                    return null;
                  },
                  onSaved: (value) => _vehiclePlate = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'DNI',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un DNI';
                    }
                    return null;
                  },
                  onSaved: (value) => _dni = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ruta',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una ruta';
                    }
                    return null;
                  },
                  onSaved: (value) => _route = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre del conductor',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un nombre de conductor';
                    }
                    return null;
                  },
                  onSaved: (value) => _driverName = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Licencia',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una licencia';
                    }
                    return null;
                  },
                  onSaved: (value) => _license = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre del inspector',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un nombre de inspector';
                    }
                    return null;
                  },
                  onSaved: (value) => _inspectorName = value,
                ),
                SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Enviar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
