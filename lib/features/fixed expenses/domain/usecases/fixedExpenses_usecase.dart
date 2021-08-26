import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:gastos_mensais/features/Fixed%20Expenses/domain/repositories/fixedExpenses_repository.dart';

import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';

import 'package:gastos_mensais/features/fixed%20expenses/utils/fixed_expenses_errors.dart';

abstract class IFixedExpensesUseCase {
  Future<Either<FixedExpensesError, bool>> createFixedExpense(
      FixedExpense fixed);
  Future<Either<FixedExpensesError, List<FixedExpense>>> listFixedExpense();
  Future<Either<FixedExpensesError, bool>> pay(FixedExpense fixed);
  Future<Either<FixedExpensesError, bool>> deleteExpense(int id);
}

class FixedExpensesUseCase implements IFixedExpensesUseCase {
  final IFixedExpensesRepository repository =
      Modular.get<IFixedExpensesRepository>();

  @override
  Future<Either<FixedExpensesError, bool>> createFixedExpense(
      FixedExpense fixed) async {
    return await repository.createFixedExpense(fixed);
  }

  @override
  Future<Either<FixedExpensesError, List<FixedExpense>>>
      listFixedExpense() async {
    return await repository.listFixedExpense();
  }

  @override
  Future<Either<FixedExpensesError, bool>> pay(FixedExpense fixed) async {
    fixed.pay = 1;
    return await repository.pay(fixed);
  }

  @override
  Future<Either<FixedExpensesError, bool>> deleteExpense(int id) async {
    return await repository.deleteExpense(id);
  }
}
