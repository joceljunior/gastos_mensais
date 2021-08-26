import 'dart:ui';

import 'package:flutter/material.dart';

class ValueWidget extends StatelessWidget {
  final bool isOpen;
  final String value;
  const ValueWidget({Key? key, required this.isOpen, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white70,
          height: 300,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 100),
            child: Text(
              "R\$ $value",
              style: TextStyle(
                color: Colors.black,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isOpen,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 18.0,
              sigmaY: 18.0,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
