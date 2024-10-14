import 'package:calcular_imc/app/view_models/imc_view_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final ImcViewModel viewModel;

  const MyHomePage({super.key, required this.viewModel});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late VoidCallback listener;

  @override
  void initState() {
    super.initState();

    listener = () {
      setState(() {});
    };

    widget.viewModel.addListener(listener);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(listener);
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                double height = double.tryParse(value) ?? 0;
                widget.viewModel.setHeight(height);
              },
            ),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                double weight = double.tryParse(value) ?? 0;
                widget.viewModel.setWeight(weight);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => widget.viewModel.calculateImc(),
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            Text(
              'Seu IMC é: ${widget.viewModel.imc.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
