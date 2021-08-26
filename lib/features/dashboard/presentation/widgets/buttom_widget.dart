import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onClick;
  const ButtomWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 180,
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.all(20.0),
          color: Color(0xff00ff5f),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Icon(
                icon,
                size: 80,
              )),
              Center(child: Text(text)),
            ],
          ),
        ),
      ),
    );
  }
}
