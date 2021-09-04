import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/Dashboard/domain/repositories/valueExpenses_repository.dart';

import 'package:gastos_mensais/features/Dashboard/presentation/widgets/buttom_widget.dart';
import 'package:gastos_mensais/features/Dashboard/presentation/widgets/eyes_widget.dart';

import 'package:gastos_mensais/features/Dashboard/presentation/widgets/value_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isOpen = false;
  String eye = 'images/eye.png';
  double value = 0.00;
  final IValueExpensesRepository usecase =
      Modular.get<IValueExpensesRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 180.0,
          backgroundColor: Color(0xff00ff5f),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ola, Jocel',
                  style: TextStyle(color: Colors.black),
                ),
                EyesWidget(
                  imageInitial: eye,
                  onclick: () {
                    eyesCloseOpen();
                  },
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            FutureBuilder<double>(
                future: usecase
                    .call()
                    .then((value) => value.fold((l) => 0, (r) => r)),
                initialData: 0.00,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Container(height: 380);
                    case ConnectionState.waiting:
                      return Container(height: 380);
                    case ConnectionState.active:
                      return Container(height: 380);
                    case ConnectionState.done:
                      value = snapshot.data!;
                      return Column(
                        children: [
                          ValueWidget(
                            isOpen: isOpen,
                            value: value.toString(),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      );
                  }
                }),
            Container(
              height: 180,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ButtomWidget(
                    icon: Icons.money_outlined,
                    text: 'Fixas',
                    onClick: () {
                      Modular.to.pushNamed('/fixed');
                    },
                  ),
                  ButtomWidget(
                    icon: Icons.money_off_csred_outlined,
                    text: 'Variaveis',
                    onClick: () {
                      Modular.to.pushNamed('/variable');
                    },
                  ),
                  ButtomWidget(
                    icon: Icons.payment,
                    text: 'Pagamentos',
                    onClick: () {
                      print('cliquei');
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void eyesCloseOpen() {
    var eyeOpen = 'images/eye.png';
    var eyeClose = 'images/eye_close.png';
    isOpen = !isOpen;

    if (isOpen) {
      setState(() {
        eye = eyeClose;
      });
    } else {
      setState(() {
        eye = eyeOpen;
      });
    }
  }
}
