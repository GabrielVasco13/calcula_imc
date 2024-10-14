import 'package:calcular_imc/app/view_models/imc_view_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ImcViewModel viewModel = ImcViewModel();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Calcular IMC"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                double height = double.tryParse(value) ?? 0;
                viewModel.setHeight(height);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                double weight = double.tryParse(value) ?? 0;
                viewModel.setWeight(weight);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => viewModel.calculateImc(),
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            Text(
              'Seu IMC é: ${viewModel.imc.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
