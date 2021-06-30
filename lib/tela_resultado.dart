import 'package:calculadora_imc/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class Resultado extends StatefulWidget {
  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  Color gradientStart = Colors.white;
  Color gradientEnd = Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStart, gradientEnd],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
          padding: EdgeInsets.all(20),
          child: CorpoResultado()),
    );
  }
}

class CorpoResultado extends StatefulWidget {
  @override
  _CorpoResultadoState createState() => _CorpoResultadoState();
}

class _CorpoResultadoState extends State<CorpoResultado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '\nResultado',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
        ),
        SizedBox(height: 20),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.purple.shade800.withOpacity(0.2),
                    offset: const Offset(0.0, 5.0),
                    blurRadius: 20.0), //BoxShadow
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        CalculoImc().calculoResultado(),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Alert(
                            context: context,
                            title: "IMC",
                            desc: "\nMagreza, menor que 18,5\n\nNormal, está entre 18,5 e 24,9\n\nSobrepeso, entre 24,9 e 30\n\nObesidade, maior que 30\n",
                            style: AlertStyle(
                              alertElevation: 0,
                              descStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                              titleStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              backgroundColor: Color(0xff3e4685),
                              alertBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              DialogButton(
                                child: Text(
                                  'Saber Mais',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  {
                                    await launch('https://www.uol.com.br/vivabem/noticias/redacao/2019/02/15/entenda-o-que-e-o-imc-e-o-que-a-medida-diz-sobre-sua-saude.htm');
                                  }
                                },
                              ),
                            ],
                          ).show();
                        },
                        icon: Icon(
                          Icons.info,
                          color: Color(0xff3e4685),
                        ))
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  CalculoImc().numero(),
                  style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'),
                ),
                SizedBox(height: 20),
                Text(
                  CalculoImc().faixa(),
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaInicial()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Refazer',
                      style: TextStyle(fontSize: 30, fontFamily: 'Nunito')),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff3e4685),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
