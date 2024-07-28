import 'package:flutter/material.dart';

class TransactionsForm extends StatefulWidget {
  final void Function(String, double) onSubmit;  

  TransactionsForm({
    super.key,
    required this.onSubmit
  });

  @override
  State<TransactionsForm> createState() => _TransactionsFormState();
}

class _TransactionsFormState extends State<TransactionsForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    valueController.dispose();
    super.dispose();
  }

  _onSubmit() {
    var title = titleController.text;
    var value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);

    titleController.clear();
    valueController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Titulo"
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _onSubmit(),
                    decoration: const InputDecoration(
                      labelText: "Valor (R\$)"
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _onSubmit,
                child: const Text("Cadastrar")
              )
            ],
          )
      ],
    );
  }
}