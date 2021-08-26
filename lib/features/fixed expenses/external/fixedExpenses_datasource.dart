import 'package:flutter_modular/flutter_modular.dart';

import 'package:gastos_mensais/features/database/domain/repositories/fixed_expenses_repository.dart';
import 'package:gastos_mensais/features/database/utils/database_errors.dart';

import '../../Fixed%20Expenses/data/datasource/fixedExpenses_datasource.dart';

class FixedExpensesDatasource implements IFixedExpensesDatasource {
  final IFixedExpenseRepository tableFixedExpenses =
      Modular.get<IFixedExpenseRepository>();

  @override
  Future<bool> createFixedExpense(Map<String, dynamic> fixed) async {
    return await tableFixedExpenses
        .createFixedExpense(fixed)
        .then((value) => value.fold((failure) {
              throw DatasourceError(message: 'Erro no datadource');
            }, (success) {
              return success;
            }));
  }

  @override
  Future<List<Map<String, dynamic>>> listFixedExpense() async {
    return await tableFixedExpenses
        .getListFixedExpense()
        .then((value) => value.fold((l) {
              throw DatasourceError(message: 'Erro no datasource');
            }, (r) {
              return r;
            }));
  }

  @override
  Future<bool> pay(Map<String, dynamic> fixed) async {
    return await tableFixedExpenses
        .payExpense(fixed)
        .then((value) => value.fold((failure) {
              throw DatasourceError(message: 'Erro no datasource');
            }, (success) {
              return success;
            }));
  }

  @override
  Future<bool> deleteExpense(int id) async {
    return await tableFixedExpenses
        .delete(id)
        .then((value) => value.fold((failure) {
              throw DatasourceError(message: 'Erro no datasource');
            }, (success) {
              return success;
            }));
  }
}
