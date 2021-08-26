import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/Dashboard/domain/errors/errors_dashboard.dart';
import 'package:gastos_mensais/features/Dashboard/domain/repositories/valueExpenses_repository.dart';

abstract class IValueExpensesUseCase {
  Future<Either<FailureNoExpenses, double>> call();
}

class ValueExpensesUseCase implements IValueExpensesUseCase {
  final IValueExpensesRepository repository =
      Modular.get<IValueExpensesRepository>();

  @override
  Future<Either<FailureNoExpenses, double>> call() async {
    final result = await repository.call();
    // ignore: unrelated_type_equality_checks
    if (result == 0) {
      return Left(FailureNoExpenses());
    }
    return result;
  }
}
