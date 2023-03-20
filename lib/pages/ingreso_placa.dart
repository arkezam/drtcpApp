import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class IngresoPlaca extends StatefulWidget {
  const IngresoPlaca({Key? key}) : super(key: key);

  @override
  State<IngresoPlaca> createState() => _IngresoPlacaState();
}

class _IngresoPlacaState extends State<IngresoPlaca> {
  @override
  Widget build(BuildContext context) {
    String? char1;

    final _formKey = GlobalKey<FormState>();

    return  SingleChildScrollView(
      child: Column(

        children: [
          Text("VERIFICACION DE VEHICULO", style: TextStyle(
              fontSize: 23, color: Colors.indigo, fontWeight: FontWeight.bold
          ),),

          SizedBox(
            height: 20,
          ),
          Image(
            image: AssetImage('assets/placa.png'),
            width: 230,

          ),
          SizedBox(
            height: 20,
          ),
          Text("Ingresa la Placa Vehicular", style: TextStyle(
              fontSize: 20, color: Colors.indigo, fontWeight: FontWeight.w400
          ),),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(

                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo,width: 3),

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(5, 5),
                            blurRadius: 10
                        )
                      ]
                  ),
                  child: SizedBox(
                    height: 65,
                    width: 250,
                    child: TextField(
                      onChanged: (value){
                        char1 = value;
                        if(value.length == 6){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      textCapitalization: TextCapitalization.characters,
                      cursorColor: Colors.indigo,

                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),

                      ],

                    ),

                  ),
                ),
              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(Size(180, 60)),
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  print("${char1}  ");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Buscando en BD ... ${char1} ")),
                  );
                }
                Navigator.pushReplacementNamed( context , 'datosPlaca' );
              },
              child: const Text("Buscar Placa", style: TextStyle(
                  fontSize: 18,  fontWeight: FontWeight.w500
              ),),
            ),
          ),
        ],
      ),
    );

  }
}


