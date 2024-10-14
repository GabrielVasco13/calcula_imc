import 'package:calcular_imc/app/model/imc_model.dart';
import 'package:flutter/material.dart';

class ImcViewModel extends ChangeNotifier {
  final ImcModel _imcModel = ImcModel(weight: 0, height: 0);

  double get imc => _imcModel.imc;

  void setHeight(double height) {
    _imcModel.height = height;
    notifyListeners();
  }

  void setWeight(double weight) {
    _imcModel.weight = weight;
    notifyListeners();
  }

  void calculateImc() {
    _imcModel.calculateImc();
    notifyListeners();
  }
}
