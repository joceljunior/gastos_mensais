import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/Dashboard/dashboard_module.dart';
import 'package:gastos_mensais/features/Dashboard/domain/repositories/valueExpenses_repository.dart';

import 'package:gastos_mensais/features/dashboard/data/repositories/valueExpenses_repository.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind<IValueExpensesRepository>((i) => ValueExpensesRepository()),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: DashboardModule(),
        ),
      ];
}
