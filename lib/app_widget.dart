import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart' as Modular;

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: "/", //rotas nomeadas
    ).modular();
  }
}
