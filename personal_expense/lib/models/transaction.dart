import 'package:flutter/foundation.dart';

class Transaction {
  final String tid;
  final String tname;
  final double price;
  final DateTime date;

  Transaction(
      {@required this.tid,
      @required this.tname,
      @required this.price,
      @required this.date});
}
