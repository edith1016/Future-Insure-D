import 'package:flutter/material.dart';
import '../../ui/widgets/landing_page/operationview.dart';

class ViewTransactions extends StatefulWidget {
  @override
  _ViewTransactionsState createState() => _ViewTransactionsState();
}

class _ViewTransactionsState extends State<ViewTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: OperationsView(),
          ),
        ));
  }
}
