abstract class IFixedExpenseDatasource {
  Future<double> getFullValue();
  Future<bool> creatFixedExpense(Map<String, dynamic> fixed);
  Future<List<Map<String, dynamic>>> getListFixedExpense();
  Future<bool> payExpense(Map<String, dynamic> expense);
  Future<bool> delete(int id);
}
