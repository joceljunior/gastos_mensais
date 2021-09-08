abstract class IVariableExpenseDatasource {
  Future<double> getFullValue();
  Future<bool> createVariableExpense(Map<String, dynamic> variable);
  Future<List<Map<String, dynamic>>> getListVariableExpense(String month);
  Future<bool> payExpense(Map<String, dynamic> variable);
  Future<bool> delete(int id);
}
