import 'dart:io';

void main(List<String> args) {
  print("valor A:");
  int a = int.parse(stdin.readLineSync().toString());
  print("valor B:");
  int b = int.parse(stdin.readLineSync().toString());

  int r = a + b;

  print("Resultado: $r");
}
