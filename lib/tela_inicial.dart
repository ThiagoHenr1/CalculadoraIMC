import 'dart:ui';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:calculadora_imc/tela_resultado.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  Color gradientStart = Colors.white;
  Color gradientEnd = Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStart, gradientEnd],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
          padding: EdgeInsets.all(20),
          child: Corpo()),
    );
  }
}

double valorSlider = 1.0;
int valorPeso = 70;
int valorIdade = 20;

class Corpo extends StatefulWidget {
  const Corpo({Key? key}) : super(key: key);

  @override
  _CorpoState createState() => _CorpoState();
}

class _CorpoState extends State<Corpo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                button('Masculino', Icons.male, Color(0xff30638E)),
                SizedBox(width: 20),
                button('Feminino', Icons.female, Color(0xffD1495B)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.purple.shade800.withOpacity(0.2),
                  offset: const Offset(0.0, 5.0),
                  blurRadius: 20.0), //BoxShadow
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Altura',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff505790),
                        fontFamily: 'Nunito')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valorSlider.toStringAsPrecision(3),
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff505790),
                          fontFamily: 'Nunito'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Text(
                        'M',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff505790),
                            fontFamily: 'Nunito'),
                      ),
                    )
                  ],
                ),
                Slider(
                    value: valorSlider,
                    min: 1.0,
                    max: 2.5,
                    activeColor: Color(0xff3e4685),
                    label: valorSlider.round().toString(),
                    onChanged: (valor) {
                      setState(() {
                        valorSlider = valor;
                      });
                    })
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.purple.shade800.withOpacity(0.2),
                            offset: const Offset(0.0, 5.0),
                            blurRadius: 20.0), //BoxShadow
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Peso',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff505790),
                              fontFamily: 'Nunito')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$valorPeso',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff505790),
                                fontFamily: 'Nunito'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 5),
                            child: Text(
                              'Kg',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff505790),
                                  fontFamily: 'Nunito'),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          floatingActionButtonPeso('-', 40, 'PesoMenos'),
                          SizedBox(width: 20),
                          floatingActionButtonPeso('+', 30, 'PesoMais')
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.purple.shade800.withOpacity(0.2),
                            offset: const Offset(0.0, 5.0),
                            blurRadius: 20.0), //BoxShadow
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Idade',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff505790),
                              fontFamily: 'Nunito')),
                      Text('$valorIdade',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff505790),
                              fontFamily: 'Nunito')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          floatingActionButtonAltura('-', 40, 'AlturaMenos'),
                          SizedBox(width: 20),
                          floatingActionButtonAltura('+', 30, 'AlturaMais')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Resultado()));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Calcular',
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
      ),
    );
  }

  Widget floatingActionButtonPeso(String texto, double tamanho, String hero) {
    return FloatingActionButton(
        heroTag: hero,
        elevation: 0,
        onPressed: () {
          setState(() {
            if (texto == '-') {
              valorPeso--;
            } else {
              valorPeso++;
            }
          });
        },
        backgroundColor: Color(0xffe5e8f8),
        child: Text(texto,
            style: TextStyle(color: Color(0xff505790), fontSize: tamanho)));
  }

  Widget floatingActionButtonAltura(String texto, double tamanho, String hero) {
    return FloatingActionButton(
        heroTag: hero,
        elevation: 0,
        onPressed: () {
          setState(() {
            if (texto == '-') {
              valorIdade--;
            } else {
              valorIdade++;
            }
          });
        },
        backgroundColor: Color(0xffe5e8f8),
        child: Text(texto,
            style: TextStyle(color: Color(0xff505790), fontSize: tamanho)));
  }

  Widget button(String texto, IconData icone, Color cor) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: cor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          if (texto == 'Masculino') {
            alerta(Color(0xff30638E));
          } else {
            alerta(Color(0xffD1495B));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, size: 80),
            Text(texto, style: TextStyle(fontSize: 25, fontFamily: 'Nunito'))
          ],
        ),
      ),
    );
  }

  alerta(Color cor) {
    Alert(
        style: AlertStyle(
          alertElevation: 0,
          backgroundColor: cor,
          titleStyle: TextStyle(color: Colors.white, fontSize: 25),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        context: context,
        title: 'Informações',
        content: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                value = value.toString().replaceAll(',', '.');
                valorSlider = double.parse(value);
              },
              decoration: InputDecoration(
                hintText: 'Altura',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                valorPeso = int.parse(value);
              },
              decoration: InputDecoration(
                hintText: 'Peso',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                valorIdade = int.parse(value);
              },
              decoration: InputDecoration(
                hintText: 'Idade',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: Colors.white,
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Text(
              "Salvar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]).show();
  }
}

class CalculoImc {
  double imc = valorPeso / (valorSlider * valorSlider);

  calculoResultado() {
    if (imc < 18.5)
      return "Abaixo do peso";
    else if (imc >= 18.6 && imc <= 24.9)
      return "Peso ideal";
    else if (imc >= 25.0 && imc <= 29.9)
      return "Levemente acima do peso";
    else if (imc >= 30.0 && imc <= 39.9)
      return "Obesidade";
    else if (imc > 40.0) return "Obesidade Grave";
  }

  faixa() {
    if (imc < 18.5)
      return "CONSULTE O SEU MÉDICO\nO cálculo entre o seu peso e altura é abaixo do recomendado. Este valor pode ser um indicativo de alguma carência nutricional.";
    else if (imc >= 18.6 && imc <= 24.9)
      return "CONTINUE, ESTÁ EM EXCELENTE FORMA!\nO seu peso está dentro da normalidade. Mantenha-o, seguindo uma dieta adequada e a praticando exercício físico.";
    else if (imc >= 25.0 && imc <= 29.9)
      return "MUDE OS SEUS HÁBITOS.\nTem algum excesso de peso em relação à sua altura. Praticar exercício físico adequado, e melhorar os seus hábitos alimentares.";
    else if (imc >= 30.0 && imc <= 39.9)
      return "ESTÁ NA HORA DE MUDAR!\nO seu IMC tem excesso de peso. Consulte o seu médico para iniciar uma programa de perda de peso e melhorar a sua saúde.";
    else if (imc > 40.0)
      return "MELHORE A SUA SAÚDE!\n O seu peso é índice de obesidade mórbida, o que poderá trazer agravamentos à sua saúde. Consulte o seu médico para conseguir ajuda.";
  }

  numero() {
    return imc.toStringAsPrecision(3);
  }
}
