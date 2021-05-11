import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addNewTx;

  NewTransactions(this.addNewTx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate==null) {
      return;
    }

    widget.addNewTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
              //onChanged: (val) {
              //  titleInput=val;
              //},
            ),
            TextField(
              decoration: InputDecoration(
                
                  labelText:
                      'Amount  (Please enter amount only in Integer form)'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              //onChanged: (val) {
              //  amountInput=val;
              //},
            ),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(23),
                      child: Text(
                        _selectedDate == null
                            ? 'No date chosen!'
                            : "Picked Date: ${DateFormat.yMMMEd().format(_selectedDate)}",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: RaisedButton(
                      onPressed: _presentDatePicker,
                      child: Text('Choose Date'),
                      color: Colors.tealAccent,
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton.icon(
              onPressed: _submitData,
              icon: Icon(Icons.add),
              label: Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
