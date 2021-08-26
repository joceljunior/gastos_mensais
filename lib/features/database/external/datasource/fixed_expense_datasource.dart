import 'package:gastos_mensais/features/database/data/datasource/fixed_expense_datasource.dart';

import 'package:gastos_mensais/features/database/external/database/app_database.dart';
import 'package:gastos_mensais/features/database/utils/constants.dart';
import 'package:gastos_mensais/features/database/utils/database_errors.dart';
import 'package:sqflite/sqflite.dart';

class FixedExpenseDatasource implements IFixedExpenseDatasource {
  @override
  Future<double> getFullValue() async {
    try {
      final Database db = await getDatabase();
      //String month = _getMonthCurrent();
      List<Map<String, dynamic>> maps = await db.query(tableFixedExpenses,
          columns: ['value'], where: 'pay = ?', whereArgs: [0]);

      double valueTotal = 0;
      for (Map<String, dynamic> row in maps) {
        valueTotal += row['value'];
      }
      return valueTotal;
    } catch (e) {
      throw DatasourceError(message: 'Erro no Datasource');
    }
  }

  @override
  Future<bool> creatFixedExpense(Map<String, dynamic> fixed) async {
    try {
      final Database db = await getDatabase();
      await db.insert(tableFixedExpenses, fixed);
      return true;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getListFixedExpense() async {
    try {
      final Database db = await getDatabase();
      List<Map<String, dynamic>> maps =
          await db.query(tableFixedExpenses, columns: [
        idFixedExpense,
        nameFixedExpense,
        descriptionFixedExpense,
        valueFixedExpense,
        monthFixedExpense,
        payFixedExpense,
      ]);

      return maps;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> payExpense(Map<String, dynamic> expense) async {
    try {
      final Database db = await getDatabase();
      await db.update(tableFixedExpenses, expense,
          where: '$idFixedExpense = ?', whereArgs: [expense['id']]);
      return true;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      final Database db = await getDatabase();
      await db.delete(tableFixedExpenses,
          where: '$idFixedExpense = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      throw Exception();
    }
  }
}
