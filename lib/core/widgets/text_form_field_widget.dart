import 'package:flutter/material.dart';

class TextFormExpensesWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final Function validValue;
  final TextInputType keyboardType;

  const TextFormExpensesWidget({
    Key? key,
    required this.controller,
    required this.icon,
    required this.validValue,
    required this.keyboardType,
    required this.label,
  }) : super(key: key);

  @override
  _TextFormExpensesWidgetState createState() => _TextFormExpensesWidgetState();
}

class _TextFormExpensesWidgetState extends State<TextFormExpensesWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      validator: widget.validValue(),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: const BorderSide(color: Color(0xff00ff5f), width: 0.0),
          ),
          prefixIcon: Icon(widget.icon),
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder()),
      controller: widget.controller,
    );
  }
}
