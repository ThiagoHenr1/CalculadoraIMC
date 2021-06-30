import 'package:calculadora_imc/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(CalculadoraImc());

class CalculadoraImc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xffe3f2fd),
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark

    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}

