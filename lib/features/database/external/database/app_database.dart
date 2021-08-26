import 'package:gastos_mensais/features/database/utils/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'Monthly_Expenses.db');
  return openDatabase(
    path,
    onCreate: _createDatabase,
    version: 5,
  );
}

Future<void> _createDatabase(db, version) async {
  List<String> queryes = [
    'CREATE TABLE $tableFixedExpenses ($idFixedExpense INTEGER PRIMARY KEY, $nameFixedExpense TEXT, $descriptionFixedExpense TEXT, $valueFixedExpense NUM, $monthFixedExpense TEXT, $payFixedExpense INT)',
  ];

  for (String query in queryes) {
    await db.execute(query);
  }
}




// class ExpensesDAO {
//   static const String sqlTable = 'CREATE TABLE $table('
//       'id INTEGER PRIMARY KEY, '
//       'name STRING, '
//       'description STRING, '
//       'value REAL, '
//       'isFixed INT, '
//       'month STRING, '
//       'pay INT)';
//   static const String table = 'Expenses';

//   Future<bool> createFixedExpenses(FixedExpense model) async {
//     try {
//       final Database db = await getDatabase();
//       Map<String, dynamic> fixedExpensesMap = _toMap(model);
//       await db.insert(table, fixedExpensesMap);
//       return true;
//     } catch (e) {
//       throw Exception();
//     }
//   }

//   Future<List<FixedExpense>> readFixedExpenses() async {
//     final Database db = await getDatabase();
//     //String month = _getMonthCurrent();
//     //, where: 'pay = ?', whereArgs: [0]
//     List<Map<String, dynamic>> maps =
//         await db.query(table, columns: ['name', 'description', 'value']);

//     List<FixedExpense> list = _toList(maps);

//     return list;
//   }

//   Future<int> update(ExpensesModel model) async {
//     final Database db = await getDatabase();
//     return await db
//         .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);
//   }

//   Future<int> delete(int id) async {
//     final Database db = await getDatabase();
//     return await db.delete(table, where: 'id = ?', whereArgs: [id]);
//   }

//   String _getMonthCurrent() {
//     var currentMonth = new DateTime.now().month;

//     return Month[currentMonth - 1].toString();
//   }

//   Map<String, dynamic> _toMap(FixedExpense model) {
//     final Map<String, dynamic> mapExpensesFixed = Map();
//     mapExpensesFixed['name'] = model.name;
//     mapExpensesFixed['description'] = model.description;
//     mapExpensesFixed['value'] = model.value;
//     mapExpensesFixed['isFixed'] = model.isFixed;
//     mapExpensesFixed['month'] = model.month;
//     mapExpensesFixed['pay'] = model.pay;
//     return mapExpensesFixed;
//   }

//   List<FixedExpense> _toList(List<Map<String, dynamic>> result) {
//     final List<FixedExpense> contacts = [];
//     for (Map<String, dynamic> row in result) {
//       final FixedExpense contact = FixedExpense(
//           name: row['name'],
//           description: row['description'],
//           value: row['value'],
//           month: 'Fixed');
//       contacts.add(contact);
//     }
//     return contacts;
//   }
// }
