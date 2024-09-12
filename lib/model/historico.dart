// Linhas de historico
class Historico {
  String _value = '0';

  List<String> separarElementos(String expressao) {
    RegExp regExp = RegExp(r'(\d+(\.\d+)?|\+|\-|\*|\/|\%)');
    Iterable<Match> matches = regExp.allMatches(expressao);
    return matches.map((match) => match.group(0)!).toList();
  }

  double calcularExpressao(List<String> elementos) {
    // 1. Aplicar multiplicação e divisão primeiro
    List<String> resultadoIntermediario = [];
    int i = 0;
    while (i < elementos.length) {
      String elemento = elementos[i];
      print (elemento);

      if (elemento == '*' || elemento == '/' || elemento == '%') {
        double numAnterior = double.parse(resultadoIntermediario.removeLast());
        double numProximo = double.parse(elementos[i + 1]);
        double resultado;

        if (elemento == '*') {
          resultado = numAnterior * numProximo;
        } else if (elemento == '/'){
          resultado = numAnterior / numProximo;
        } else {
          resultado = numAnterior / 100 * numProximo;
        }

        resultadoIntermediario.add(resultado.toString());
        i += 2; // Pula o próximo número pois já foi usado
      } else {
        resultadoIntermediario.add(elemento);
        i++;
      }
    }

    // 2. Aplicar soma e subtração
    double resultadoFinal = double.parse(resultadoIntermediario[0]);

    for (int i = 1; i < resultadoIntermediario.length; i += 2) {
      String operador = resultadoIntermediario[i];
      double proximoNumero = double.parse(resultadoIntermediario[i + 1]);

      if (operador == '+') {
        resultadoFinal += proximoNumero;
      } else if (operador == '-') {
        resultadoFinal -= proximoNumero;
      }
    }

    return resultadoFinal;
  }

  void apply(String text) {
    if (text == 'CE') {
      _value = '0';
      return;
    } else if (_value == 'Error') {
      _value = text;
    } else if (text == 'C') {
      if (_value.length == 1) {
        _value = '0';
      } else {
        _value = _value.substring(0, _value.length - 1);
      }
      return;
    } else if (text == '=') {
      try {
        List<String> elementos = separarElementos(_value);
        double resultado = calcularExpressao(elementos);
        _value = resultado.toString();
      } catch (e) {
        _value = 'Error';
      }
    } else {
      if (_value == '0') {
        _value = text;
      } else {
        _value += text;
      }
    }
  }

  String get value {
    return _value;
  }
}
