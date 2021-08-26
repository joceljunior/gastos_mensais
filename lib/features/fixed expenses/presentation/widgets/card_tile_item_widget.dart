import 'package:flutter/material.dart';

import 'package:gastos_mensais/features/fixed%20expenses/domain/entities/fixed_expenses.dart';

class CardTileItemWidget extends StatefulWidget {
  final FixedExpense model;

  final Color colorPay;

  const CardTileItemWidget(
      {Key? key, required this.colorPay, required this.model})
      : super(key: key);

  @override
  _CardTileItemWidgetState createState() => _CardTileItemWidgetState();
}

class _CardTileItemWidgetState extends State<CardTileItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Card(
        elevation: 10.0,
        child: ListTile(
          tileColor: Color(0xff0D8F6CE),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.model.name),
                Text(
                  "R\$ " + widget.model.value.toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.model.description),
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
                        // await payFixedExpense(widget.model);
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
                        //  widget.deleteItem();
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

  // Future<bool> payFixedExpense(FixedExpense model) async {
  //   return await useCase.pay(model).then((value) => value.fold((failure) {
  //         return false;
  //       }, (success) {
  //         return success;
  //       }));
  // }
}
