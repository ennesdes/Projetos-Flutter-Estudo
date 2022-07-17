import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  String? texto;
  void Function()? onSelecao;

  Respostas({this.texto, this.onSelecao});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        child: Text(texto!),
        onPressed: onSelecao,
      ),
    );
  }
}
