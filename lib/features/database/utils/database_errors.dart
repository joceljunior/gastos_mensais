abstract class DatabaseError implements Exception {}

class RepositoryError implements DatabaseError {
  final String message;

  RepositoryError({required this.message});
}

class DatasourceError implements DatabaseError {
  final String message;

  DatasourceError({required this.message});
}
