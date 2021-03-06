import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/core/constants/enums.dart';

import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';
import 'package:gastos_mensais/features/fixed%20expenses/domain/usecases/fixed_expenses_usecase.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/entities/variable_expenses.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/usecases/variable_expenses_usecase.dart';

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
  var currentSelectedValue;

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
          height: !widget.isFixed ? 340 : 280,
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
                Visibility(
                  visible: !widget.isFixed,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: Color(0xff00ff5f), width: 0.0),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text("Selecione o Mês"),
                        value: currentSelectedValue,
                        isDense: true,
                        onChanged: (newValue) {
                          setState(() {
                            currentSelectedValue = newValue;
                          });
                          print(currentSelectedValue);
                        },
                        items: months.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
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
                widget.isFixed ? createFixedExpense() : createVariableExpense();
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

  createFixedExpense() {
    var model = FixedExpense(
        name: nameController.text,
        description: descriptionController.text,
        value: double.parse(valueController.text),
        pay: 0,
        month: 'Fixas');

    Modular.get<FixedExpensesUseCase>().createFixedExpense(model).then(
          (result) => result.fold(
            (l) => false,
            (r) {
              nameController.clear();
              descriptionController.clear();
              valueController.clear();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Despesa Fixa gerada!'),
                  backgroundColor: Colors.green,
                ),
              );
              return true;
            },
          ),
        );

    Navigator.pop(context, true);
  }

  createVariableExpense() {
    var model = VariableExpense(
        name: nameController.text,
        description: descriptionController.text,
        value: double.parse(valueController.text),
        pay: 0,
        month: currentSelectedValue);

    Modular.get<VariableExpensesUsecase>().createVariableExpense(model).then(
          (result) => result.fold(
            (l) => false,
            (r) {
              nameController.clear();
              descriptionController.clear();
              valueController.clear();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Despesa Variavel gerada!'),
                  backgroundColor: Colors.green,
                ),
              );
              return true;
            },
          ),
        );

    Navigator.pop(context, true);
  }
}
