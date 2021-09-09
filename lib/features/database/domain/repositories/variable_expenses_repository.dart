import 'package:dartz/dartz.dart';
import 'package:gastos_mensais/features/database/utils/database_errors.dart';

abstract class IVariableExpenseRepository {
  Future<Either<DatabaseError, double>> getFullValue();
  Future<Either<DatabaseError, bool>> createVariableExpense(
      Map<String, dynamic> variable);
  Future<Either<DatabaseError, List<Map<String, dynamic>>>>
      getListVariableExpense(String? month);
  Future<Either<DatabaseError, bool>> payExpense(Map<String, dynamic> variable);
  Future<Either<DatabaseError, bool>> delete(int id);
}
