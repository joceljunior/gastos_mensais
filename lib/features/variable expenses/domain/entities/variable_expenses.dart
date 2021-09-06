class VariableExpense {
  int? id;
  String name;
  String description;
  num value;
  String month;
  int pay;

  VariableExpense({
    this.id,
    required this.name,
    required this.description,
    required this.value,
    required this.month,
    required this.pay,
  });
}
