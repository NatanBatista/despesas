import 'package:flutter/material.dart';

class TransactionsBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const TransactionsBar({
    super.key,
    required this.label,
    required this.value,
    required this.percentage
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text("R\$ ${value.toStringAsFixed(2)}")),
        const SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FractionallySizedBox(
            heightFactor: percentage,
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color:const Color.fromARGB(255, 114, 23, 23),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}