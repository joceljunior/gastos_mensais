import 'package:flutter/material.dart';

import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';

import 'package:gastos_mensais/features/fixed%20expenses/presentation/widgets/text_itempay_widget.dart';

class CardItemWidget extends StatefulWidget {
  final FixedExpense model;
  final Function delete;

  const CardItemWidget({
    Key? key,
    required this.model,
    required this.delete,
  }) : super(key: key);

  @override
  _CardItemWidgetState createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  //IFixedExpensesUseCase useCase = Modular.get<IFixedExpensesUseCase>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(color: Color(0xff00ff5f))),
      child: Card(
        elevation: 10.0,
        child: ListTile(
          tileColor:
              widget.model.pay != 1 ? Colors.white70 : Color(0xff0D8F6CE),
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
                        // var model = FixedExpense(
                        //     id: widget.id,
                        //     name: widget.name,
                        //     description: widget.description,
                        //     value: widget.value,
                        //     month: widget.month,
                        //     pay: widget.pay);
                        // await payFixedExpense(model);

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
                      onPressed: () {
                        // await delete(widget.id);
                        widget.delete();
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
  }
}
