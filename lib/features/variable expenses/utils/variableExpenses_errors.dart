abstract class VariableExpensesError implements Exception {}

class DatasourceError extends VariableExpensesError {
  final String message;

  DatasourceError({required this.message});
}
