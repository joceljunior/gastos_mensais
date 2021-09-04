class VariableExpenses {
  final int id;
  final String name;
  final String? description;
  final num value;
  final String month;
  final int? pay;

  VariableExpenses(
      {required this.id,
      required this.name,
      required this.description,
      required this.value,
      required this.month,
      required this.pay});
}
