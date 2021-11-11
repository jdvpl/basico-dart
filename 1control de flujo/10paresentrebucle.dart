import 'dart:io';

void main() {
  paresEntreDosNumeros();
}

void paresEntreDosNumeros() {
  stdout.write("Ingrese el primer numero: ");
  var a = stdin.readLineSync();
  stdout.write("Ingrese el segundo numero: ");
  var b = stdin.readLineSync();
  int num1 = int.parse(a!);
  int num2 = int.parse(b!);

  if (num1 < num2) {
    for (int i = num1; i <= num2; i++) {
      if (i % 2 == 0) {
        print(i);
      }
    }
  } else if (num1 == num2) {
    print("Los numeros son iguales no hay pares entre ellos");
  } else {
    for (int i = num1; i >= num2; i--) {
      if (i % 2 == 0) {
        print(i);
      }
    }
  }
}
