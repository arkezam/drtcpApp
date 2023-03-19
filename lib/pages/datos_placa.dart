
import 'package:drtcp/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:drtcp/widgets/custum_input.dart';
import 'package:flutter/material.dart';
class DatosPlaca extends StatefulWidget {
  const DatosPlaca({Key? key}) : super(key: key);

  @override
  State<DatosPlaca> createState() => _DatosPlacaState();
}

class _DatosPlacaState extends State<DatosPlaca> {
  final origenController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Logo( titulo: 'Datos del Vehículo' ),
              SizedBox(height: 20,),
              Text("Numero De Placa"),
              Text("Datos de Vehiculo"),
              Text("Estado"),
              Text("Ultima"),
              _Form(),
              ElevatedButton(onPressed: () => _Form(), child: Text("Finalizar revisión")),
              ElevatedButton(onPressed: () => _Form(), child: Text("Añadir infracción I7c"))
            ],
          ),
        ),
      )


    );

  }
}
class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}


class __FormState extends State<_Form> {

  final origenController = TextEditingController();
  final destinoController  = TextEditingController();
  final dniController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: 50 ),
      child: Column(
        children: <Widget>[

          CustomInput(
            icon: Icons.emoji_transportation,
            placeholder: 'Origen',
            keyboardType: TextInputType.text,
            textController: origenController,
          ),

          CustomInput(
            icon: Icons.assignment_return,
            placeholder: 'Destino',
            keyboardType: TextInputType.text,
            textController: destinoController,

          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'DNI',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción que se realiza cuando se presiona el botón
                },
                child: Text('Verificar'),
              ),
            ],
          ),
          SizedBox(height: 50,)


        ],
      ),
    );
  }
}