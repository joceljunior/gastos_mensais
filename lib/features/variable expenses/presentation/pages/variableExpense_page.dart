import 'package:flutter/material.dart';

class VariableExpensesPage extends StatefulWidget {
  const VariableExpensesPage({Key? key}) : super(key: key);

  @override
  _VariableExpensesPageState createState() => _VariableExpensesPageState();
}

class _VariableExpensesPageState extends State<VariableExpensesPage> {
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
                  'Contas Varaiveis',
                  style: TextStyle(color: Colors.black),
                ),
                FloatingActionButton(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () async {})
              ],
            ),
          ),
        ),
        body: Container());
  }
}
