import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UsertTransaction extends StatefulWidget {
  @override
  _UsertTransactionState createState() => _UsertTransactionState();
}

class _UsertTransactionState extends State<UsertTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //NewTransaction(_addNewTransaction),
        //TransactionList(_userTransaction)
      ],
    );
  }
}
