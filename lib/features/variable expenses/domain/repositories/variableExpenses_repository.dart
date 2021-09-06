import 'package:dartz/dartz.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/entities/variable_expenses.dart';
import 'package:gastos_mensais/features/variable%20expenses/utils/variableExpenses_errors.dart';

abstract class IVariableExpensesRepository {
  Future<Either<VariableExpensesError, bool>> createVariableExpense(
      VariableExpense variable);
}
