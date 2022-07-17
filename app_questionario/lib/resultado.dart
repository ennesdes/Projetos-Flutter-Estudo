import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resultado extends StatelessWidget {
  final int? pontuacao;
  final void Function()? quandoReiniciar;

  Resultado({this.pontuacao, this.quandoReiniciar});

  String? get fraseResultado {
    if (pontuacao! < 8) {
      return 'Parabéns!';
    } else if (pontuacao! < 12) {
      return 'Você é bom!';
    } else if (pontuacao! < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado!,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(primary: Colors.blue),
          onPressed: quandoReiniciar!,
          child: Text('Reiniciar?', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
