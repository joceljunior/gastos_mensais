import 'package:flutter/material.dart';

import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';

import 'package:gastos_mensais/features/fixed%20expenses/presentation/widgets/text_itempay_widget.dart';

class CardItemWidget extends StatefulWidget {
  final FixedExpense model;
  final Function delete;
  final Function payExpense;
  final Function cancelPayExpense;

  const CardItemWidget({
    Key? key,
    required this.model,
    required this.delete,
    required this.payExpense,
    required this.cancelPayExpense,
  }) : super(key: key);

  @override
  _CardItemWidgetState createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  var colorTextPay = Color(0xff0D8F6CE);
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(5),
        height: !isDelete ? 150 : 1,
        decoration: BoxDecoration(
            color: !isDelete ? Colors.white : Colors.red,
            border:
                Border.all(color: !isDelete ? Color(0xff00ff5f) : Colors.red)),
        child: Opacity(
          opacity: !isDelete ? 1.0 : 0.0,
          child: Card(
            elevation: 10.0,
            child: ListTile(
              tileColor: widget.model.pay != 1 ? Colors.white70 : colorTextPay,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.model.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    widget.model.pay != 1
                        ? Text(
                            "R\$ " + widget.model.value.toString(),
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        : TextItemPayWidget(),
                  ],
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.model.description,
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
                            setState(() {
                              if (widget.model.pay == 1) {
                                widget.cancelPayExpense();
                              } else {
                                widget.payExpense();
                              }
                            });
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
                            final result = await confirmDelete(context);
                            if (result) {
                              setState(() {
                                isDelete = !isDelete;
                              });
                              Future.delayed(const Duration(seconds: 1), () {
                                widget.delete();
                              });
                            }
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
        ));
  }

  Future confirmDelete(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(child: Text('Excluir')),
              content: Text('Deseja excluir despesa fixa?'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Color(0xff00ff5f),
                      child: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.redAccent,
                      child: Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ],
                )
              ],
            ));
  }
}
