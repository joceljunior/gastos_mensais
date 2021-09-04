abstract class IVariableExpenseDatasource {
  Future<double> getFullValue();
  Future<bool> createVariableExpense(Map<String, dynamic> variable);
}
