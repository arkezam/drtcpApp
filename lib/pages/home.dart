import 'package:drtcp/pages/ingreso_placa.dart';
import 'package:drtcp/widgets/boton_azul.dart';
import 'package:drtcp/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
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
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image( image: AssetImage('assets/logo1.png') ),
            ),
            SizedBox(height: 50),
            Expanded(child: IngresoPlaca())
          ],
        ),
      ),
    );
  }
}
