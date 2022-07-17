import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './questionario.dart';
import './resultado.dart';
import './controller.dart';

main() => runApp(App_Questionario());

class App_Questionario extends StatelessWidget {
  Controller controller = Get.put(Controller());

  App_Questionario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Obx(
        () => Scaffold(
          appBar: AppBar(title: const Center(child: Text('Perguntas'))),
          body: SafeArea(
            child: controller.temPerguntaSelecionada
                ? Questionario(
                    perguntas: controller.perguntas,
                    perguntaSelecionada: controller.perguntaSelecionada.value,
                    quandoResponder: controller.responder)
                : Resultado(
                    pontuacao: controller.pontuacaoTotal.value,
                    quandoReiniciar: controller.reiniciarQuestionario,
                  ),
          ),
        ),
      ),
    );
  }
}
