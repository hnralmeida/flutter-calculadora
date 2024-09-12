import 'package:flutter/material.dart';

styleDefault() {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.deepPurple,
    backgroundColor: Colors.white,
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w300,
    ),
  );
}

styleDark() {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.deepPurple,
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w300,
    ),
  );
}

styleOperation() {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.amber,
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w300,
    ),
  );
}

class Button extends StatelessWidget {
  final String text;
  final bool big;
  final bool dark;
  final bool operation;

  final void Function (String) callback;

  Button({
    required this.text,
    required this.callback,
    this.big = false,
    this.dark = false,
    this.operation = false,
  });

  Button.big({
    required this.text,
    required this.callback,
    this.big = true,
    this.dark = false,
    this.operation = false,
  });

  Button.operation({
    required this.text,
    required this.callback,
    this.big = false,
    this.dark = false,
    this.operation = true,
  });

  Button.dark({
    required this.text,
    required this.callback,
    this.big = false,
    this.dark = true,
    this.operation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: big ? 2 : 1,
        child: ElevatedButton(
          style: operation ? styleOperation() : dark ? styleDark() : styleDefault(),
          onPressed: () => callback(text),
          child: Text(text),
        )
      );
  }
}
