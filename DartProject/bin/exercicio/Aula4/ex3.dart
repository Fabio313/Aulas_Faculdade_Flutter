import 'dart:io';

void main(List<String> args) {
  print("Digite um numero:");
  int a = int.parse(stdin.readLineSync().toString());

  print("Antecessor: ${a - 1}");
  print("Numero: ${a}");
  print("Sucessor: ${a + 1}");
}
