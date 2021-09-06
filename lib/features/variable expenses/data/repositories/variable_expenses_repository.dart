import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/variable%20expenses/data/datasource/variable_expenses_datasource.dart';
import 'package:gastos_mensais/features/variable%20expenses/data/models/variable_expenses_model.dart';

import 'package:gastos_mensais/features/variable%20expenses/domain/entities/variable_expenses.dart';
import 'package:dartz/dartz.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/repositories/variableExpenses_repository.dart';
import 'package:gastos_mensais/features/variable%20expenses/utils/variableExpenses_errors.dart';

class VariableExpensesRepository implements IVariableExpensesRepository {
  final IVariableExpensesDatasource datasource =
      Modular.get<IVariableExpensesDatasource>();
  @override
  Future<Either<VariableExpensesError, bool>> createVariableExpense(
      VariableExpense variable) async {
    try {
      var model = VariableExpensesModel(
          name: variable.name,
          description: variable.description,
          value: variable.value,
          month: variable.month,
          pay: variable.pay);
      var modelMap = model.toMap();
      final result = await datasource.createVariableExpense(modelMap);
      return Right(result);
    } on DatasourceError {
      return Left(DatasourceError(message: 'Erro no datasource'));
    }
  }
}
