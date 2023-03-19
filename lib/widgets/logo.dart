
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String titulo;

  const Logo({
    Key? key,
    required this.titulo
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 270,
        margin: EdgeInsets.only( top: 70 ),
        child: Column(
          children: <Widget>[
            Text( this.titulo, textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[700]
                )),
            SizedBox( height: 45 ),
            Image( image: AssetImage('assets/logo1.png') ),



          ],
        ),
      ),
    );
  }
}