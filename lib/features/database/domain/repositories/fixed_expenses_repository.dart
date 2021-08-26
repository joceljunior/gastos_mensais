import 'package:dartz/dartz.dart';

import 'package:gastos_mensais/features/database/utils/database_errors.dart';

abstract class IFixedExpenseRepository {
  Future<Either<DatabaseError, double>> getFullValue();
  Future<Either<DatabaseError, bool>> createFixedExpense(
      Map<String, dynamic> fixed);
  Future<Either<DatabaseError, List<Map<String, dynamic>>>>
      getListFixedExpense();
  Future<Either<DatabaseError, bool>> payExpense(Map<String, dynamic> expense);
  Future<Either<DatabaseError, bool>> delete(int id);
}
