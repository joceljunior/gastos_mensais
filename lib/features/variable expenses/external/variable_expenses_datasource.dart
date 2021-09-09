import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/database/domain/repositories/variable_expenses_repository.dart';
import 'package:gastos_mensais/features/variable%20expenses/data/datasource/variable_expenses_datasource.dart';

class VariableExpensesDatasource implements IVariableExpensesDatasource {
  final IVariableExpenseRepository tableVariableExpenses =
      Modular.get<IVariableExpenseRepository>();
  @override
  Future<bool> createVariableExpense(Map<String, dynamic> variable) async {
    return await tableVariableExpenses
        .createVariableExpense(variable)
        .then((value) => value.fold((failure) {
              throw failure;
            }, (success) {
              return success;
            }));
  }
}
