import 'dart:io';

void main(List<String> args) {
  print("Digite A:");
  int a = int.parse(stdin.readLineSync().toString());
  print("Digite B:");
  int b = int.parse(stdin.readLineSync().toString());
  print("Digite C:");
  int c = int.parse(stdin.readLineSync().toString());

  print("A+B < C:" + ((a + b) < c).toString());
}
