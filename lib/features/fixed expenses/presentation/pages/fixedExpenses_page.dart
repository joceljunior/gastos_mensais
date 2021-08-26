import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:gastos_mensais/core/widgets/form_expenses_widget.dart';

import 'package:gastos_mensais/features/Fixed%20Expenses/domain/usecases/fixedExpenses_usecase.dart';
import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';

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

                  return Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff00ff5f))),
                    child: Card(
                      elevation: 10.0,
                      child: ListTile(
                        tileColor: model.pay != 1
                            ? Colors.white70
                            : Color(0xff0D8F6CE),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                model.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              model.pay != 1
                                  ? Text(
                                      "R\$ " + model.value.toString(),
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : itempay(),
                            ],
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                model.description,
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 0.3,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 40,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.green,
                                    onPressed: () async {
                                      //model.pay = 1;
                                      await payFixedExpense(model);
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.payment,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                Container(
                                  height: 50,
                                  width: 40,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.red,
                                    onPressed: () async {
                                      await delete(model.id!);
                                      setState(() {});
                                    },
                                    child: Icon(Icons.delete),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
        builder: (BuildContext context) => FormExpenses(
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

  Future<bool> delete(int id) async {
    return await useCase
        .deleteExpense(id)
        .then((value) => value.fold((failure) {
              return false;
            }, (success) {
              return success;
            }));
  }

  Widget itempay() {
    return Text(
      "PAGO",
      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}
