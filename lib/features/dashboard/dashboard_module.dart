import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/Dashboard/data/datasources/valueExpenses_datasource.dart';
import 'package:gastos_mensais/features/Dashboard/data/repositories/valueExpenses_repository.dart';
import 'package:gastos_mensais/features/Dashboard/domain/repositories/valueExpenses_repository.dart';
import 'package:gastos_mensais/features/Dashboard/domain/usecases/valueExpensesUseCase.dart';
import 'package:gastos_mensais/features/Dashboard/presentation/pages/dashboard_page.dart';
import 'package:gastos_mensais/features/Fixed%20Expenses/FixedExpenses_module.dart';
import 'package:gastos_mensais/features/dashboard/external/datasource/valueExpenses_datadource.dart';
import 'package:gastos_mensais/features/database/data/datasource/fixed_expense_datasource.dart';
import 'package:gastos_mensais/features/database/data/repositories/fixed_expense_repository.dart';
import 'package:gastos_mensais/features/database/domain/repositories/fixed_expenses_repository.dart';
import 'package:gastos_mensais/features/database/external/datasource/fixed_expense_datasource.dart';
import 'package:gastos_mensais/features/variable%20expenses/variableExpenses_module.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IFixedExpenseRepository>((i) => FixedExpenseRepository()),
        Bind<IFixedExpenseDatasource>((i) => FixedExpenseDatasource()),
        Bind<IValueExpensesDatasource>((i) => ValueExpensesDatasource()),
        Bind<IValueExpensesRepository>((i) => ValueExpensesRepository()),
        Bind<IValueExpensesUseCase>((i) => ValueExpensesUseCase()),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => DashboardPage(),
        ),
        ModuleRoute('/fixed', module: FixedExpensesModule()),
        ModuleRoute('/variable', module: VariableExpensesModule()),
      ];
}
