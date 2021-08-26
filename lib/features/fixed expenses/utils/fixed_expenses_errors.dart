abstract class FixedExpensesError implements Exception {}

class DatasourceError extends FixedExpensesError {
  final String message;

  DatasourceError({required this.message});
}
