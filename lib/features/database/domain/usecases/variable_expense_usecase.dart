import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/database/domain/repositories/variable_expenses_repository.dart';
import 'package:gastos_mensais/features/database/utils/database_errors.dart';

abstract class IVariableExpenseUsecase {
  Future<Either<DatabaseError, double>> getFullValue();
  Future<Either<DatabaseError, bool>> createVariableExpense(
      Map<String, dynamic> variable);
  Future<Either<DatabaseError, List<Map<String, dynamic>>>>
      getListVariableExpense(String? month);
  Future<Either<DatabaseError, bool>> payExpense(Map<String, dynamic> variable);
  Future<Either<DatabaseError, bool>> delete(int id);
}

class VariableExpenseUsecase implements IVariableExpenseUsecase {
  final repository = Modular.get<IVariableExpenseRepository>();
  @override
  Future<Either<DatabaseError, bool>> createVariableExpense(
      Map<String, dynamic> variable) async {
    return await repository.createVariableExpense(variable);
  }

  @override
  Future<Either<DatabaseError, double>> getFullValue() async {
    return await repository.getFullValue();
  }

  @override
  Future<Either<DatabaseError, bool>> delete(int id) async {
    return await repository.delete(id);
  }

  @override
  Future<Either<DatabaseError, List<Map<String, dynamic>>>>
      getListVariableExpense(String? month) async {
    return await repository.getListVariableExpense(month);
  }

  @override
  Future<Either<DatabaseError, bool>> payExpense(
      Map<String, dynamic> variable) async {
    return await repository.payExpense(variable);
  }
}
