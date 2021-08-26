import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/core/widgets/form_expenses_widget.dart';
import 'package:gastos_mensais/features/Fixed%20Expenses/data/datasource/fixedExpenses_datasource.dart';
import 'package:gastos_mensais/features/Fixed%20Expenses/data/repositories/fixedExpenses_repository.dart';
import 'package:gastos_mensais/features/Fixed%20Expenses/domain/repositories/fixedExpenses_repository.dart';
import 'package:gastos_mensais/features/Fixed%20Expenses/domain/usecases/fixedExpenses_usecase.dart';
import 'package:gastos_mensais/features/Fixed%20Expenses/external/fixedExpenses_datasource.dart';
import 'package:gastos_mensais/features/Fixed%20Expenses/presentation/pages/fixedExpenses_page.dart';
import 'package:gastos_mensais/features/database/data/datasource/fixed_expense_datasource.dart';
import 'package:gastos_mensais/features/database/data/repositories/fixed_expense_repository.dart';
import 'package:gastos_mensais/features/database/domain/repositories/fixed_expenses_repository.dart';
import 'package:gastos_mensais/features/database/external/datasource/fixed_expense_datasource.dart';

class FixedExpensesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IFixedExpenseRepository>((i) => FixedExpenseRepository()),
        Bind<IFixedExpenseDatasource>((i) => FixedExpenseDatasource()),
        Bind<IFixedExpensesUseCase>((i) => FixedExpensesUseCase()),
        Bind<IFixedExpensesRepository>((i) => FixedExpensesRepository()),
        Bind<IFixedExpensesDatasource>((i) => FixedExpensesDatasource()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => FixedExpensesPage(),
        ),
        ChildRoute('/formExpense',
            child: (context, args) => FormExpenses(
                  isFixed: args.data,
                )),
      ];
}
