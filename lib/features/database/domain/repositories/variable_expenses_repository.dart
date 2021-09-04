import 'package:dartz/dartz.dart';
import 'package:gastos_mensais/features/database/utils/database_errors.dart';

abstract class IVariableExpensesRepository {
  Future<Either<DatabaseError, double>> getFullValue();
  Future<Either<DatabaseError, bool>> createVariableExpense(
      Map<String, dynamic> variable);
}
