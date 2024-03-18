import 'dart:io';

void main(List<String> args) {
  print("Digite quanto é um salario minimo:");
  double salarioMinimo = double.parse(stdin.readLineSync().toString());

  print("Digite quanto é seu salario:");
  double salario = double.parse(stdin.readLineSync().toString());

  print(
      "Voce recebe cerca de ${(salario / salarioMinimo).floor()} salarios minimos");
}
