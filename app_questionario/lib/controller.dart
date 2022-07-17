import 'package:get/get.dart';

import 'questionario.dart';

class Controller extends GetxController {
  RxInt perguntaSelecionada = 0.obs;
  RxInt pontuacaoTotal = 0.obs;

  final RxList<Map<String, Object>> perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual marca favorita?',
      'respostas': [
        {'texto': 'Apple', 'pontuacao': 10},
        {'texto': 'Amazon', 'pontuacao': 5},
        {'texto': 'Facebook', 'pontuacao': 3},
        {'texto': 'Google', 'pontuacao': 1},
      ],
    },
  ].obs;

  Future<void> responder(int pontucao) async {
    if (temPerguntaSelecionada) {
      perguntaSelecionada++;
      pontuacaoTotal += pontucao;
    }
  }

  Future<void> reiniciarQuestionario() async {
    perguntaSelecionada.value = 0;
    pontuacaoTotal.value = 0;
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }
}
