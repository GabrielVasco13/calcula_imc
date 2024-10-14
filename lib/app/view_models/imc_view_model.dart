import 'package:calcular_imc/app/model/imc_model.dart';

class ImcViewModel extends ImcModel {
  ImcViewModel({
    required super.weight,
    required super.height,
  });

  double calculateImc() {
    return weight / (height * height);
  }
}
