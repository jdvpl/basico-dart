import 'dart:io';

void main() {
  paresImparesNegativosPositivos();
}

void paresImparesNegativosPositivos() {
  stdout.write("Ingrese la cantidad de numero a pedir: ");
  var a = stdin.readLineSync();
  int num1 = int.parse(a!);

  for (var i = 0; i < num1; i++) {
    stdout.write("Ingrese el numero a analizar: ");
    var b = stdin.readLineSync();
    int num2 = int.parse(b!);
    String dato = "";
    if (num2 < 0) {
      dato += "El numero $num2 es negativo";
    }
    if (num2 >= 0) {
      dato += "El numero $num2 es positivo";
    }
    if (num2 % 2 == 0) {
      dato += " y es par";
    }
    if (num2 % 2 == 1) {
      dato += " y es impar";
    }
    print(dato);
  }
}
