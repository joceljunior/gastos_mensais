import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/features/variable%20expenses/presentation/pages/variableExpense_page.dart';

class VariableExpensesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => VariableExpensesPage(),
        ),
      ];
}
