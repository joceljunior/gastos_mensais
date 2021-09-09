import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/database/data/datasource/variable_expense_datasource.dart';
import 'package:gastos_mensais/features/database/domain/repositories/variable_expenses_repository.dart';
import 'package:gastos_mensais/features/database/utils/database_errors.dart';

class VariableExpenseRepository implements IVariableExpenseRepository {
  final datasource = Modular.get<IVariableExpenseDatasource>();
  @override
  Future<Either<DatabaseError, bool>> createVariableExpense(
      Map<String, dynamic> variable) async {
    try {
      final result = await datasource.createVariableExpense(variable);
      return Right(result);
    } on RepositoryError {
      return Left(RepositoryError(message: 'Erro no data'));
    }
  }

  @override
  Future<Either<DatabaseError, double>> getFullValue() async {
    try {
      final result = await datasource.getFullValue();
      return Right(result);
    } on RepositoryError {
      return Left(RepositoryError(message: 'Erro no data'));
    }
  }

  @override
  Future<Either<DatabaseError, bool>> delete(int id) async {
    try {
      final result = await datasource.delete(id);
      return Right(result);
    } on RepositoryError {
      return Left(RepositoryError(message: 'Erro no data'));
    }
  }

  @override
  Future<Either<DatabaseError, List<Map<String, dynamic>>>>
      getListVariableExpense(String? month) async {
    try {
      final result = await datasource.getListVariableExpense(month);
      return Right(result);
    } on RepositoryError {
      return Left(RepositoryError(message: 'Erro no data'));
    }
  }

  @override
  Future<Either<DatabaseError, bool>> payExpense(
      Map<String, dynamic> variable) async {
    try {
      final result = await datasource.payExpense(variable);
      return Right(result);
    } on RepositoryError {
      return Left(RepositoryError(message: 'Erro no data'));
    }
  }
}
