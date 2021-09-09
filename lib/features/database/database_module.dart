import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/database/data/datasource/fixed_expense_datasource.dart';
import 'package:gastos_mensais/features/database/data/datasource/variable_expense_datasource.dart';
import 'package:gastos_mensais/features/database/data/repositories/variable_expense_repository.dart';
import 'package:gastos_mensais/features/database/domain/repositories/fixed_expenses_repository.dart';
import 'package:gastos_mensais/features/database/domain/repositories/variable_expenses_repository.dart';
import 'package:gastos_mensais/features/database/domain/usecases/variable_expense_usecase.dart';
import 'package:gastos_mensais/features/database/external/datasource/fixed_expense_datasource.dart';
import 'package:gastos_mensais/features/database/external/datasource/variable_expense_datasource.dart';

import 'data/repositories/fixed_expense_repository.dart';
import 'domain/usecases/fixed_expense_usecase.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IFixedExpenseDatasource>((i) => FixedExpenseDatasource()),
        Bind<IVariableExpenseDatasource>((i) => VariableExpenseDatasource()),
        Bind<IFixedExpenseRepository>((i) => FixedExpenseRepository()),
        Bind<IVariableExpenseRepository>((i) => VariableExpenseRepository()),
        Bind<IFixedExpenseUseCase>((i) => FixedExpenseUseCase()),
        Bind<IVariableExpenseUsecase>((i) => VariableExpenseUsecase()),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [];
}
