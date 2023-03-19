import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

  final String text;
  final  VoidCallback  onPressed;

  const BotonAzul({
    Key? key,
    required this.text,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: this.onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                )
            )
          
        ),
        
        child: Container(

      height: 55,
      child: Center(
        child: Text( this.text ,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22 ),

        ),
      )
    ));
  }

}