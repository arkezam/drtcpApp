import 'package:drtcp/pages/home.dart';
import 'package:drtcp/pages/ingreso_placa.dart';
import 'package:flutter/material.dart';

import 'package:drtcp/pages/loading_page.dart';
import 'package:drtcp/pages/datos_placa.dart';
import 'package:drtcp/pages/login_page.dart';
final Map<String, Widget Function(BuildContext)> appRoutes = {

  'login'       : ( _ ) => LoginPage(),
  'loading'     : ( _ ) => LoadingPage(),
  'home'        : ( _ ) => Home(),
  'ingresoPlaca'    : ( _ ) => IngresoPlaca(),
  'datosPlaca'   : ( _ ) => DatosPlaca(),
};


