import 'package:drtcp/pages/ingreso_placa.dart';
import 'package:drtcp/widgets/boton_azul.dart';
import 'package:drtcp/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? char1 = '';

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Menu Principal"),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.indigo,
              child: Text(
                'Consultas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 0),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Consulta Vehicular'),
              onTap: () {
                _launchInBrowser(Uri(scheme: 'https', host: 'www.sunarp.gob.pe/ConsultaVehicular', path: 'headers/'));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('SLCP'),
              onTap: () {
                _launchInBrowser(Uri(scheme: 'https', host: 'slcp.mtc.gob.pe'));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_railway),
              title: Text('SCPPP'),
              onTap: () {
                _launchInBrowser(Uri(scheme: 'https', host: 'scppp.mtc.gob.pe', path: 'headers/'));
              },
            ),
            ListTile(
              leading: Icon(Icons.car_repair_outlined),
              title: Text('Reporte DGT'),
              onTap: () {
                _launchInBrowser(Uri(scheme: 'https', host: 'portal.mtc.gob.pe/reportedgtt/form/frmconsultaplacaitv.aspx', path: 'headers/'));
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.indigo,
              child: Text(
                'Manuales',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.error),
              title: Text('Infracciones'),
              onTap: () {
                _launchInBrowser(Uri(scheme: 'https', host: 'portal.mtc.gob.pe/reportedgtt/form/frmconsultaplacaitv.aspx', path: 'headers/'));
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Incumplimientos'),
              onTap: () {
                _launchInBrowser(Uri(scheme: 'https', host: 'portal.mtc.gob.pe/reportedgtt/form/frmconsultaplacaitv.aspx', path: 'headers/'));
              },
            ),
            SizedBox(
              height: 120,
            ),
            ListTile(
              title: Text('Cerrar sesión'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                // Aquí se debe agregar la lógica para cerrar la sesión
              },
            ),
          ],
        ),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text("VERIFICACION DE VEHICULO", style: TextStyle(
                          fontSize: 23, color: Colors.indigo, fontWeight: FontWeight.bold
                      )),
                      SizedBox(height: 20),
                      Image(image: AssetImage('assets/placa.png'), width: 230),
                      SizedBox(height: 20),
                      Text("Ingresa la Placa Vehicular", style: TextStyle(
                          fontSize: 20, color: Colors.indigo, fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.indigo, width: 3),
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

                            onChanged: (value) {
                              char1 = value;

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
                            inputFormatters: [LengthLimitingTextInputFormatter(6)],
                          ),
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
                            if (_formKey.currentState!.validate()) {
                              print("${char1}  ");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Buscando en BD ... ${char1} ")),
                              );
                            }
                            if(char1==""){
                              Navigator.pushNamed(context, 'actaControl');
                            }
                            else
                            Navigator.pushNamed(context, 'datosPlaca');
                          },
                          child: const Text("Buscar Placa", style: TextStyle(
                              fontSize: 18,  fontWeight: FontWeight.w500
                          )),
                        ),
                      ),
                      Image( image: AssetImage('assets/logo1.png') ),
                      SizedBox(height: 200)
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      );

  }
}
