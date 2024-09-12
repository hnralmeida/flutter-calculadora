import 'package:flutter/material.dart';
import 'package:flutter_aula_1/components/button.dart';
import 'package:flutter_aula_1/components/buttonRow.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) callback;

  const Keyboard({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: Column(
          children: <Widget>[
            ButtonRow([
              Button.dark(text: '%', callback:callback),
              Button.dark(text: 'CE', callback:callback),
              Button.dark(text: 'C', callback:callback),
              Button.operation(text: '/', callback:callback),
            ]),
            ButtonRow([
              Button(text: '7', callback: callback,),
              Button(text: '8', callback: callback,),
              Button(text: '9', callback: callback,),
              Button.operation(text: '*', callback:callback),
            ]),
            ButtonRow([
              Button(text: '4', callback: callback,),
              Button(text: '5', callback: callback,),
              Button(text: '6', callback: callback,),
              Button.operation(text: '+', callback:callback),
            ]),
            ButtonRow([
              Button(text: '1', callback: callback,),
              Button(text: '2', callback: callback,),
              Button(text: '3', callback: callback,),
              Button.operation(text: '-', callback:callback),
            ]),
            ButtonRow([
              Button(text: '0', big: true,callback: callback,),
              Button(text: '.', callback: callback,),
              Button.operation(text: '=', callback:callback),
            ]),
          ],
        ));
  }
}
