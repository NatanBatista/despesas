import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {

  final List<Transaction> transactions;


  const TransactionsList({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty ? 
        Column(
          children: [
            const SizedBox(height: 10,),
            const Text("Nenhuma despesa cadastrada!"),
            const SizedBox(height: 10,),
            SizedBox(
              height: 200,
              child: Image.asset("assets/images/waiting.png"),
            )
          ],
        )
      : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
        final e = transactions[index];
      
        return Card(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${e.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    DateFormat("d MMM y").format(e.date),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),
                  )
                ],
              )
            ],
          ),
        );
        },
      ),
    );
  }
}