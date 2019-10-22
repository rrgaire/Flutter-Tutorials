import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function removeTransaction;

  TransactionList(this.userTransactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Opps! No transactions yet..',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(userTransaction: userTransactions[index], removeTransaction: removeTransaction);
            },
            itemCount: userTransactions.length,
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
