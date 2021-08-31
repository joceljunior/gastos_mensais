import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/fixed%20expenses/data/models/fixed_expenses_model.dart';
import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';

import 'package:gastos_mensais/features/fixed%20expenses/utils/fixed_expenses_errors.dart';

import '../../../Fixed%20Expenses/data/datasource/fixedExpenses_datasource.dart';
import '../../../Fixed%20Expenses/domain/repositories/fixedExpenses_repository.dart';

class FixedExpensesRepository implements IFixedExpensesRepository {
  final IFixedExpensesDatasource datasource =
      Modular.get<IFixedExpensesDatasource>();

  @override
  Future<Either<FixedExpensesError, bool>> createFixedExpense(
      FixedExpense fixed) async {
    try {
      var model = FixedExpensesModel(
          name: fixed.name,
          description: fixed.description,
          value: fixed.value,
          month: fixed.month,
          pay: fixed.pay);
      var modelMap = model.toMap();
      final result = await datasource.createFixedExpense(modelMap);
      return Right(result);
    } on DatasourceError {
      return Left(DatasourceError(message: 'Erro no datasource'));
    }
  }

  @override
  Future<Either<FixedExpensesError, List<FixedExpense>>>
      listFixedExpense() async {
    try {
      final map = await datasource.listFixedExpense();
      final List<FixedExpense> listModel = [];
      for (Map<String, dynamic> row in map) {
        final FixedExpense model = FixedExpense(
          id: row['id'],
          name: row['name'],
          description: row['description'],
          value: row['value'],
          month: row['month'],
          pay: row['pay'],
        );
        listModel.add(model);
      }

      return Right(listModel);
    } on DatasourceError {
      return Left(DatasourceError(message: 'Erro no datasource'));
    }
  }

  @override
  Future<Either<FixedExpensesError, bool>> pay(FixedExpense fixed) async {
    try {
      var model = {
        'id': fixed.id,
        'name': fixed.name,
        'description': fixed.description,
        'value': fixed.value,
        'month': fixed.month,
        'pay': fixed.pay
      };
      final result = await datasource.pay(model);
      return Right(result);
    } on DatasourceError {
      return Left(DatasourceError(message: 'Erro no datasource'));
    }
  }

  @override
  Future<Either<FixedExpensesError, bool>> deleteExpense(int id) async {
    try {
      final result = await datasource.deleteExpense(id);
      return Right(result);
    } on DatasourceError {
      return Left(DatasourceError(message: 'Erro no datasource'));
    }
  }

  @override
  Future<Either<FixedExpensesError, bool>> cancelPay(FixedExpense fixed) async {
    try {
      var model = {
        'id': fixed.id,
        'name': fixed.name,
        'description': fixed.description,
        'value': fixed.value,
        'month': fixed.month,
        'pay': fixed.pay
      };
      final result = await datasource.pay(model);
      return Right(result);
    } on DatasourceError {
      return Left(DatasourceError(message: 'Erro no datasource'));
    }
  }
}
