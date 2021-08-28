import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';
import 'package:gastos_mensais/features/fixed%20expenses/domain/usecases/fixed_expenses_usecase.dart';

import 'text_form_field_widget.dart';

class FormExpenses extends StatefulWidget {
  final bool isFixed;
  FormExpenses({
    Key? key,
    required this.isFixed,
  }) : super(key: key);

  @override
  _FormExpensesState createState() => _FormExpensesState();
}

class _FormExpensesState extends State<FormExpenses> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Container(
          child: const Text('Despesa Fixa'),
        ),
      ),
      content: SingleChildScrollView(
        child: Container(
          height: 280,
          width: 350,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormExpensesWidget(
                    label: 'Nome da Despesa',
                    controller: nameController,
                    icon: Icons.near_me,
                    validValue: () {},
                    keyboardType: TextInputType.name),
                SizedBox(height: 20),
                TextFormExpensesWidget(
                    label: 'Descrição da Despesa',
                    controller: descriptionController,
                    icon: Icons.description,
                    validValue: () {},
                    keyboardType: TextInputType.text),
                SizedBox(height: 20),
                TextFormExpensesWidget(
                    label: 'Valor',
                    controller: valueController,
                    icon: Icons.monetization_on,
                    validValue: () {},
                    keyboardType: TextInputType.number),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: Color(0xff00ff5f),
              child: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () {
                widget.isFixed
                    ? createFixedExpense(context)
                    : print('variable');
              },
            ),
            FloatingActionButton(
              backgroundColor: Colors.redAccent,
              child: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        )
      ],
    );
  }

  void createFixedExpense(BuildContext context) {
    IFixedExpensesUseCase usecase = Modular.get<IFixedExpensesUseCase>();
    var model = FixedExpense(
        name: nameController.text,
        description: descriptionController.text,
        value: double.parse(valueController.text),
        pay: 0,
        month: 'Fixas');

    //Modular.get<FixedExpensesUseCase>().createFixedExpense(model);
    usecase.createFixedExpense(model).then(
          (result) => result.fold(
            (l) => null,
            (r) {
              nameController.clear();
              descriptionController.clear();
              valueController.clear();
              Navigator.pop(context, 'Cancel');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Despesa Fixa gravada!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        );

    Modular.to.pushNamed('/fixed', arguments: true);
    Navigator.pop(context, true);
  }
}
