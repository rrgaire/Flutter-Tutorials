import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function removeTransaction;

  TransactionList(this.userTransactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 348,
      child: userTransactions.isEmpty
          ? Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Opps! No transactions yet..',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 300,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
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
                            'Rs ${userTransactions[index].price}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      userTransactions[index].tname,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(userTransactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => removeTransaction(userTransactions[index].tid),
                    ),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}

// an alternative to transaction list using card
// Card(
//                   elevation: 6,
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                           vertical: 10,
//                           horizontal: 15,
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                           color: Colors.green,
//                           width: 2,
//                         )),
//                         width: 90,
//                         height: 50,
//                         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 6,),
//                         child: FittedBox(
//                                                   child: Text(
//                             'Rs ${userTransactions[index].price.toStringAsFixed(2)}',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             userTransactions[index].tname,
//                             style: Theme.of(context).textTheme.title,
//                           ),
//                           Text(
//                             DateFormat.yMMMMd()
//                                 .format(userTransactions[index].date),
//                             style: TextStyle(
//                               color: Colors.black87,
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 )
