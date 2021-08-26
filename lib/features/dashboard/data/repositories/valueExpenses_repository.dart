import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/Dashboard/data/datasources/valueExpenses_datasource.dart';
import 'package:gastos_mensais/features/Dashboard/domain/errors/errors_dashboard.dart';
import 'package:dartz/dartz.dart';
import 'package:gastos_mensais/features/Dashboard/domain/repositories/valueExpenses_repository.dart';

class ValueExpensesRepository implements IValueExpensesRepository {
  final IValueExpensesDatasource datasource =
      Modular.get<IValueExpensesDatasource>();

  @override
  Future<Either<FailureNoExpenses, double>> call() async {
    try {
      final value = await datasource.call();
      return Right(value);
    } on FailureNoExpenses catch (e) {
      return Left(e);
    } on Exception {
      return Left(FailureNoExpenses());
    }
  }
}
