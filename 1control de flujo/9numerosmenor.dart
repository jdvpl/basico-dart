import 'dart:io';

void main() {
  printMenoraMayot();
}

void printMenoraMayot() {
  stdout.write("Ingrese el primer numero: ");
  var a = stdin.readLineSync();
  stdout.write("Ingrese el segundo numero: ");
  var b = stdin.readLineSync();
  int num1 = int.parse(a!);
  int num2 = int.parse(b!);

  if (num1 < num2) {
    print("Menor: $num1, Mayor: $num2");
  } else if (num1 == num2) {
    print("Los numeros $num1 y $num2 son iguales");
  } else {
    print("Menor: $num2, Mayor: $num1");
  }
}
