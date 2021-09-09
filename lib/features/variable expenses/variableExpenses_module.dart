import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/database/data/repositories/variable_expense_repository.dart';
import 'package:gastos_mensais/features/database/domain/repositories/variable_expenses_repository.dart';

import 'package:gastos_mensais/features/variable%20expenses/data/datasource/variable_expenses_datasource.dart';
import 'package:gastos_mensais/features/variable%20expenses/data/repositories/variable_expenses_repository.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/repositories/variableExpenses_repository.dart';

import 'package:gastos_mensais/features/variable%20expenses/domain/usecases/variable_expenses_usecase.dart';
import 'package:gastos_mensais/features/variable%20expenses/external/variable_expenses_datasource.dart';
import 'package:gastos_mensais/features/variable%20expenses/presentation/pages/variableExpense_page.dart';

class VariableExpensesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IVariableExpenseRepository>((i) => VariableExpenseRepository()),
        Bind<IVariableExpensesUsecase>((i) => VariableExpensesUsecase()),
        Bind<IVariableExpensesRepository>((i) => VariableExpensesRepository()),
        Bind<IVariableExpensesDatasource>((i) => VariableExpensesDatasource()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => VariableExpensesPage(),
        ),
      ];
}
