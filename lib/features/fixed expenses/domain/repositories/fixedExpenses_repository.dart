import 'package:dartz/dartz.dart';

import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';

import 'package:gastos_mensais/features/fixed%20expenses/utils/fixed_expenses_errors.dart';

abstract class IFixedExpensesRepository {
  Future<Either<FixedExpensesError, bool>> createFixedExpense(
      FixedExpense fixed);
  Future<Either<FixedExpensesError, List<FixedExpense>>> listFixedExpense();
  Future<Either<FixedExpensesError, bool>> pay(FixedExpense fixed);
}
