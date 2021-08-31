import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:gastos_mensais/core/widgets/form_expenses_widget.dart';

import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';
import 'package:gastos_mensais/features/fixed%20expenses/domain/usecases/fixed_expenses_usecase.dart';
import 'package:gastos_mensais/features/fixed%20expenses/presentation/widgets/card_item_expense_widget.dart';

class FixedExpensesPage extends StatefulWidget {
  FixedExpensesPage({
    Key? key,
  }) : super(key: key);

  @override
  _FixedExpensesPageState createState() => _FixedExpensesPageState();
}

class _FixedExpensesPageState extends State<FixedExpensesPage> {
  IFixedExpensesUseCase useCase = Modular.get<IFixedExpensesUseCase>();

  @override
  void initState() {
    super.initState();
  }

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
                'Contas Fixas',
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
      body: FutureBuilder<List<FixedExpense>>(
        initialData: [],
        future: useCase.listFixedExpense().then((value) => value.fold((l) {
              return [];
            }, (r) {
              return r;
            })),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return Container();
            case ConnectionState.active:
              return Container();
            case ConnectionState.done:
              final List<FixedExpense> expenses = snapshot.data!;
              return ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final FixedExpense model = expenses[index];
                  return CardItemWidget(
                    model: model,
                    delete: () async {
                      await delete(model.id!);
                      setState(() {});
                    },
                    payExpense: () async {
                      await payFixedExpense(model);
                    },
                    cancelPayExpense: () async {
                      await cancelPayFixedExpense(model);
                    },
                  );
                },
              );
          }
        },
      ),
    );
  }

  Future<bool?> showFormFixedExpenses(BuildContext context) async {
    await showDialog<bool>(
        context: context,
        builder: (context) => FormExpenses(
              isFixed: true,
            ));
  }

  Future<bool> payFixedExpense(FixedExpense model) async {
    return await useCase.pay(model).then((value) => value.fold((failure) {
          return false;
        }, (success) {
          return success;
        }));
  }

  Future<bool> cancelPayFixedExpense(FixedExpense model) async {
    return await useCase.cacelPay(model).then((value) => value.fold((failure) {
          return false;
        }, (success) {
          return success;
        }));
  }

  Future<bool> delete(int id) async {
    return await useCase
        .deleteExpense(id)
        .then((value) => value.fold((failure) {
              return false;
            }, (success) {
              return success;
            }));
  }
}
