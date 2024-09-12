import 'package:flutter/material.dart';
import 'package:flutter_aula_1/components/display.dart';
import 'package:flutter_aula_1/components/keyboard.dart';
import 'package:flutter_aula_1/model/historico.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  final Historico historico = Historico();

  _onPressed(String text) {
    setState(() {
      historico.apply(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Display(historico.value),
        Keyboard(callback: _onPressed),
      ],
    );
  }
}
