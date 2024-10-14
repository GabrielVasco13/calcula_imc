class ImcModel {
  double weight;
  double height;
  double imc;

  ImcModel({
    required this.weight,
    required this.height,
    this.imc = 0.0,
  });

  double calculateImc() {
    imc = weight / (height * height);
    return imc;
  }
}
