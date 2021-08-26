import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';

class FixedExpensesModel extends FixedExpense {
  FixedExpensesModel({
    final int? id,
    required String name,
    required String description,
    required num value,
    required String month,
    required int pay,
  }) : super(
            name: name,
            description: description,
            month: month,
            pay: pay,
            value: value);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'value': value,
      'month': month,
      'pay': pay
    };
  }
}
