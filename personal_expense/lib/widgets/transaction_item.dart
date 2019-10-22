import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.removeTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function removeTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'Rs ${userTransaction.price}',
              ),
            ),
          ),
        ),
        title: Text(
          userTransaction.tname,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(userTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                onPressed: () =>
                    removeTransaction(userTransaction.tid),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    removeTransaction(userTransaction.tid),
              ),
      ),
    );
  }
}