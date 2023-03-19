import 'package:drtcp/widgets/boton_azul.dart';
import 'package:drtcp/widgets/custum_input.dart';
import 'package:drtcp/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Logo( titulo: 'SUB DIRECCION DE FISCALIZACION' ),

                  _Form(),

                  // Labels(
                  //   ruta: 'register',
                  //   titulo: '¿No tienes cuenta?',
                  //   subTitulo: 'Solicita una Ahora!',
                  // ),

                  Text('Términos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200 ),)

                ],
              ),
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

  final userCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: 50 ),
      child: Column(
        children: <Widget>[

          CustomInput(
            icon: Icons.person,
            placeholder: 'Usuario',
            keyboardType: TextInputType.text,
            textController: userCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),


          BotonAzul(
            text: 'Iniciar Sesión',
            onPressed: () {
              Navigator.pushReplacementNamed( context , 'home' );
              print( userCtrl.text );
              print( passCtrl.text );
            },
          )



        ],
      ),
    );
  }
}
