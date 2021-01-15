import 'dart:io';
import 'package:Misgastos/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime _selectedDate;
  void _submitData() {
    if (_amountcontroller.text.isEmpty) {
      return;
    }
    final enteredTitle = _titlecontroller.text;
    final enteredamount = double.parse(_amountcontroller.text);
    if (enteredTitle.isEmpty || enteredamount < 0 || _selectedDate == null) {
      return;
    }
    //print(amountInput);
    widget.addNewTransaction(enteredTitle, enteredamount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Producto'),
                controller: _titlecontroller,
                //onChanged: (val) { titleInput = val;},
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Precio'),
                controller: _amountcontroller,
                keyboardType: TextInputType.number,

                onSubmitted: (_) => _submitData(),
                //onChanged: (val) => amountInput = val,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No ha seleccionado fecha!'
                            : DateFormat.yMd().format(_selectedDate),
                      ),
                    ),
                    AdaptiveFlatButton('Seleccionar fecha', _presentDatePicker)
                  ],
                ),
              ),
              RaisedButton(
                  onPressed: _submitData,
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).textTheme.button.color,
                  child: Text('Añadir una compra'))
            ],
          ),
        ),
      ),
    );
  }
}
