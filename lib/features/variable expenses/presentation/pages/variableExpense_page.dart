import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_mensais/core/widgets/form_expenses_widget.dart';

import 'package:gastos_mensais/features/fixed%20expenses/presentation/widgets/card_item_expense_widget.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/entities/variable_expenses.dart';
import 'package:gastos_mensais/features/variable%20expenses/domain/usecases/variable_expenses_usecase.dart';

class VariableExpensesPage extends StatefulWidget {
  const VariableExpensesPage({Key? key}) : super(key: key);

  @override
  _VariableExpensesPageState createState() => _VariableExpensesPageState();
}

class _VariableExpensesPageState extends State<VariableExpensesPage> {
  IVariableExpensesUsecase useCase = Modular.get<IVariableExpensesUsecase>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180.0,
        backgroundColor: Color(0xff00ff5f),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Contas Variaveis',
                style: TextStyle(color: Colors.black),
              ),
              FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await showFormFixedExpenses(context);

                    setState(() {});
                  })
            ],
          ),
        ),
      ),
      body: Container(),
      // body: FutureBuilder<List<VariableExpense>>(
      //   initialData: [],
      //   future:
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.none:
      //         return Container();
      //       case ConnectionState.waiting:
      //         return Container();
      //       case ConnectionState.active:
      //         return Container();
      //       case ConnectionState.done:
      //         final List<VariableExpense> expenses = snapshot.data!;
      //         return ListView.builder(
      //           itemCount: expenses.length,
      //           itemBuilder: (context, index) {
      //             final VariableExpense model = expenses[index];
      //             return Container();
      //             // return CardItemWidget(
      //             //   model: model,
      //             //   delete: () async {
      //             //     await delete(model.id!);
      //             //     setState(() {});
      //             //   },
      //             //   payExpense: () async {
      //             //     await payFixedExpense(model);
      //             //   },
      //             //   cancelPayExpense: () async {
      //             //     await cancelPayFixedExpense(model);
      //             //   },
      //             // );
      //           },
      //         );
      //     }
      //   },
      // ),
    );
  }

  Future<bool?> showFormFixedExpenses(BuildContext context) async {
    await showDialog<bool>(
        context: context,
        builder: (context) => FormExpenses(
              isFixed: false,
            ));
  }
}
