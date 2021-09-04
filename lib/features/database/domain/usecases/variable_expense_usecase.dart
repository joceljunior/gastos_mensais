import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/database/domain/repositories/variable_expenses_repository.dart';
import 'package:gastos_mensais/features/database/utils/database_errors.dart';

abstract class IVariableExpenseUsecase {
  Future<Either<DatabaseError, double>> getFullValue();
  Future<Either<DatabaseError, bool>> createVariableExpense(
      Map<String, dynamic> variable);
}

class VariableExpenseUsecase implements IVariableExpenseUsecase {
  final repository = Modular.get<IVariableExpensesRepository>();
  @override
  Future<Either<DatabaseError, bool>> createVariableExpense(
      Map<String, dynamic> variable) async {
    return await repository.createVariableExpense(variable);
  }

  @override
  Future<Either<DatabaseError, double>> getFullValue() async {
    return await repository.getFullValue();
  }
}
