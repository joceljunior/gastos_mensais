import 'package:flutter/material.dart';

class TextItemPayWidget extends StatelessWidget {
  const TextItemPayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "PAGO",
      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}
