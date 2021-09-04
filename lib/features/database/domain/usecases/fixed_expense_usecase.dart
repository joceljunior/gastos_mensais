import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:gastos_mensais/features/database/utils/database_errors.dart';

import '../repositories/fixed_expenses_repository.dart';

abstract class IFixedExpenseUseCase {
  Future<Either<DatabaseError, bool>> createFixedExpense(
      Map<String, dynamic> fixed);
  Future<Either<DatabaseError, double>> getFullValue();
  Future<Either<DatabaseError, List<Map<String, dynamic>>>>
      getListFixedExpense();
  Future<Either<DatabaseError, bool>> payExpense(Map<String, dynamic> expense);
  Future<Either<DatabaseError, bool>> delete(int id);
}

class FixedExpenseUseCase implements IFixedExpenseUseCase {
  final IFixedExpenseRepository repository =
      Modular.get<IFixedExpenseRepository>();

  @override
  Future<Either<DatabaseError, double>> getFullValue() async {
    // regras de negocio
    return await repository.getFullValue();
  }

  @override
  Future<Either<DatabaseError, bool>> createFixedExpense(
      Map<String, dynamic> fixed) async {
    return await repository.createFixedExpense(fixed);
  }

  @override
  Future<Either<DatabaseError, List<Map<String, dynamic>>>>
      getListFixedExpense() async {
    return await repository.getListFixedExpense();
  }

  @override
  Future<Either<DatabaseError, bool>> payExpense(
      Map<String, dynamic> expense) async {
    return await repository.payExpense(expense);
  }

  @override
  Future<Either<DatabaseError, bool>> delete(int id) async {
    return await repository.delete(id);
  }
}
