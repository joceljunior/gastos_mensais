import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/Dashboard/data/datasources/valueExpenses_datasource.dart';
import 'package:gastos_mensais/features/database/domain/repositories/fixed_expenses_repository.dart';
import 'package:gastos_mensais/features/database/domain/repositories/variable_expenses_repository.dart';

class ValueExpensesDatasource implements IValueExpensesDatasource {
  final IFixedExpenseRepository tableFixedExpenses =
      Modular.get<IFixedExpenseRepository>();
  final IVariableExpenseRepository tableVariableExpenses =
      Modular.get<IVariableExpenseRepository>();
  @override
  Future<double> call() async {
    var fixed = await tableFixedExpenses
        .getFullValue()
        .then((value) => value.fold((failure) {
              throw failure;
            }, (sucess) {
              return sucess;
            }));
    var variable = await tableVariableExpenses
        .getFullValue()
        .then((value) => value.fold((failure) {
              throw failure;
            }, (success) {
              return success;
            }));
    print(variable.toString());
    print(fixed.toString());
    return variable + fixed;
  }
}
