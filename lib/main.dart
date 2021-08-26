import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/app_module.dart';
import 'package:gastos_mensais/app_widget.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));

  // IFixedExpensesRepository table = Modular.get<IFixedExpensesRepository>();
  // IValueExpensesRepository dash = Modular.get<IValueExpensesRepository>();
  // var model = FixedExpense(
  //     name: 'Keila',
  //     description: 'Tia Carmem',
  //     value: 250.56,
  //     month: 'Outubro',
  //     pay: 0);

  // table.createFixedExpense(model);
  // debugPrint('Valor total:');
  // print(dash.call());
}
