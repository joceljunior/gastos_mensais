import 'package:gastos_mensais/features/variable%20expenses/domain/entities/variable_expenses.dart';

abstract class IVariableExpensesDatasource {
  Future<bool> createVariableExpense(Map<String, dynamic> variable);
}
