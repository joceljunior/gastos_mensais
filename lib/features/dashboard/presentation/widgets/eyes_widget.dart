import 'package:flutter/material.dart';

class EyesWidget extends StatefulWidget {
  final Function onclick;
  final String imageInitial;
  EyesWidget({
    Key? key,
    required this.onclick,
    required this.imageInitial,
  }) : super(key: key);

  @override
  _EyesWidgetState createState() => _EyesWidgetState();
}

class _EyesWidgetState extends State<EyesWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onclick();
      },
      child: ImageIcon(
        AssetImage(widget.imageInitial),
        size: 80,
        color: Colors.black,
      ),
    );
  }
}
