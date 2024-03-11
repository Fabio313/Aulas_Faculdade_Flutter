import 'dart:io';

bool ParOuImpar(int i) {
  return i % 2 == 0;
}

bool PositivoOuNegativo(int i) {
  return i >= 0;
}

void main(List<String> args) {
  print("Digite um numero:");
  int a = int.parse(stdin.readLineSync().toString());

  if (ParOuImpar(a))
    print("É par");
  else
    print("É impar");

  if (PositivoOuNegativo(a))
    print("É positivo");
  else
    print("É negativo");
}
