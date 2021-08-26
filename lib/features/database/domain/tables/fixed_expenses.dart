class FixedExpense {
  final int id;
  final String name;
  final String? description;
  final num value;
  final String month;
  final int? pay;

  FixedExpense({
    required this.id,
    required this.name,
    required this.description,
    required this.value,
    required this.month,
    required this.pay,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'description': description,
  //     'value': value,
  //     'isFixed': isFixed,
  //     'month': month,
  //     'pay': pay
  //   };
  // }

  // factory ExpensesModel.fromMap(Map<String, dynamic> map) {
  //   return ExpensesModel(
  //     id: map['id'],
  //     name: map['name'],
  //     description: map['description'],
  //     value: map['value'],
  //     isFixed: map['isFixed'],
  //     month: map['month'],
  //     pay: map['pay'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory ExpensesModel.fromJson(String source) =>
  //     ExpensesModel.fromMap(json.decode(source));

  // ExpensesModel copyWith(
  //     {int? id,
  //     String? name,
  //     String? description,
  //     num? value,
  //     int? isFixed,
  //     String? month,
  //     int? pay}) {
  //   return ExpensesModel(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     description: description ?? this.description,
  //     value: value ?? this.value,
  //     isFixed: isFixed ?? this.isFixed,
  //     month: month ?? this.month,
  //     pay: pay ?? this.pay,
  //   );
  // }

  // @override
  // String toString() {
  //   return 'ExpensesModel(id: $id, name: $name, description: $description, value: $value, isFixed: $isFixed, month: $month, pay: $pay)';
  // }
}
