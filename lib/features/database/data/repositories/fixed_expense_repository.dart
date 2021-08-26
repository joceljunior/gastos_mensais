import 'package:flutter_modular/flutter_modular.dart';
import 'package:dartz/dartz.dart';
import 'package:gastos_mensais/features/database/data/datasource/fixed_expense_datasource.dart';

import 'package:gastos_mensais/features/database/domain/repositories/fixed_expenses_repository.dart';

import 'package:gastos_mensais/features/database/utils/database_errors.dart';

class FixedExpenseRepository implements IFixedExpenseRepository {
  final IFixedExpenseDatasource datasource =
      Modular.get<IFixedExpenseDatasource>();
  @override
  Future<Either<RepositoryError, double>> getFullValue() async {
    try {
      final result = await datasource.getFullValue();
      return Right(result);
    } on RepositoryError {
      return Left(RepositoryError(message: 'Erro no data'));
    }
  }

  @override
  Future<Either<DatabaseError, bool>> createFixedExpense(
      Map<String, dynamic> fixed) async {
    try {
      final result = await datasource.creatFixedExpense(fixed);
      return Right(result);
    } on RepositoryError {
      return Left(RepositoryError(message: 'Erro no data'));
    }
  }

  @override
  Future<Either<DatabaseError, List<Map<String, dynamic>>>>
      getListFixedExpense() async {
    try {
      final result = await datasource.getListFixedExpense();
      return Right(result);
    } on RepositoryError {
      return left(RepositoryError(message: 'Erro no data'));
    }
  }

  @override
  Future<Either<DatabaseError, bool>> payExpense(
      Map<String, dynamic> expense) async {
    try {
      final result = await datasource.payExpense(expense);
      return Right(result);
    } on RepositoryError {
      return left(RepositoryError(message: 'Erro no data'));
    }
  }

  @override
  Future<Either<DatabaseError, bool>> delete(int id) async {
    try {
      final result = await datasource.delete(id);
      return Right(result);
    } on RepositoryError {
      return left(RepositoryError(message: 'Erro no data'));
    }
  }
}
