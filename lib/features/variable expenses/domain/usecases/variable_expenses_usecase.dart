import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/entities/variable_expenses.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/repositories/variableExpenses_repository.dart';
import 'package:gastos_mensais/features/variable%20expenses/utils/variableExpenses_errors.dart';

abstract class IVariableExpensesUsecase {
  Future<Either<VariableExpensesError, bool>> createVariableExpense(
      VariableExpense variable);
}

class VariableExpensesUsecase implements IVariableExpensesUsecase {
  final IVariableExpensesRepository repository =
      Modular.get<IVariableExpensesRepository>();

  @override
  Future<Either<VariableExpensesError, bool>> createVariableExpense(
      VariableExpense variable) async {
    return await repository.createVariableExpense(variable);
  }
}
