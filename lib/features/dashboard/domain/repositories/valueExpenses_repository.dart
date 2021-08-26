import 'package:dartz/dartz.dart';
import 'package:gastos_mensais/features/Dashboard/domain/errors/errors_dashboard.dart';

abstract class IValueExpensesRepository {
  Future<Either<FailureNoExpenses, double>> call();
}
