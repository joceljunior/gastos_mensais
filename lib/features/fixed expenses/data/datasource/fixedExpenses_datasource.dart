abstract class IFixedExpensesDatasource {
  Future<bool> createFixedExpense(Map<String, dynamic> fixed);
  Future<List<Map<String, dynamic>>> listFixedExpense();
  Future<bool> pay(Map<String, dynamic> fixed);
  Future<bool> deleteExpense(int id);
}
