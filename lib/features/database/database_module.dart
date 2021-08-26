import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/database/data/datasource/fixed_expense_datasource.dart';
import 'package:gastos_mensais/features/database/external/datasource/fixed_expense_datasource.dart';

import 'data/repositories/fixed_expense_repository.dart';
import 'domain/usecases/fixed_expense_usecase.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IFixedExpenseDatasource>((i) => FixedExpenseDatasource()),
        Bind<FixedExpenseRepository>((i) => FixedExpenseRepository()),
        Bind<IFixedExpenseUseCase>((i) => FixedExpenseUseCase()),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [];
}
