import 'package:gastos_mensais/features/database/data/datasource/variable_expense_datasource.dart';
import 'package:gastos_mensais/features/database/external/database/app_database.dart';
import 'package:gastos_mensais/features/database/utils/constants.dart';
import 'package:gastos_mensais/features/database/utils/database_errors.dart';
import 'package:sqflite/sqflite.dart';

class VariableExpenseDatasource implements IVariableExpenseDatasource {
  @override
  Future<bool> createVariableExpense(Map<String, dynamic> variable) async {
    try {
      final Database db = await getDatabase();
      await db.insert(tableVariableExpenses, variable);
      return true;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<double> getFullValue() async {
    try {
      final Database db = await getDatabase();
      //String month = _getMonthCurrent();
      List<Map<String, dynamic>> maps = await db.query(tableVariableExpenses,
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
  Future<bool> delete(int id) async {
    try {
      final Database db = await getDatabase();
      await db.delete(
        tableVariableExpenses,
        where: '$idVariableExpense = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getListVariableExpense(
      String? month) async {
    try {
      List<Map<String, dynamic>> maps;
      final Database db = await getDatabase();
      if (month != null) {
        maps = await db.query(
          tableVariableExpenses,
          columns: [
            idVariableExpense,
            nameVariableExpense,
            descriptionVariableExpense,
            valueVariableExpense,
            monthVariableExpense,
            payVariableExpense,
          ],
          where: '$monthVariableExpense = ?',
          whereArgs: [month],
        );
      } else {
        maps = await db.query(
          tableVariableExpenses,
          columns: [
            idVariableExpense,
            nameVariableExpense,
            descriptionVariableExpense,
            valueVariableExpense,
            monthVariableExpense,
            payVariableExpense,
          ],
          where: '$monthVariableExpense = ?',
          whereArgs: [month],
        );
      }

      return maps;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> payExpense(Map<String, dynamic> variable) async {
    try {
      final Database db = await getDatabase();
      await db.update(tableVariableExpenses, variable,
          where: '$idVariableExpense = ?', whereArgs: [variable['id']]);
      return true;
    } catch (e) {
      throw Exception();
    }
  }
}
