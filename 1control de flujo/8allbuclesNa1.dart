import 'dart:io';

void main() {
  stdout.write("Ingrese el Numero n para los bucles: ");
  var numero = stdin.readLineSync();
  int n = int.parse(numero!);
  if (n <= 1) {
    print("El numero debe ser mayor que uno");
    return;
  }
  bucleFor(n);
  bucleWhile(n);
  bucleDoWhile(n);
}

// bucle flor
void bucleFor(int n) {
  print("\n ****** Bucle For *********\n");
  for (int i = n; i >= 1; i--) {
    print(i);
  }
}

// bucle while
void bucleWhile(int n) {
  print("\n ****** Bucle While *********\n");
  while (n >= 1) {
    print(n);
    n--;
  }
}

// bucle do while
void bucleDoWhile(int n) {
  print("\n ****** Bucle Do While *********\n");
  do {
    print(n);
    n--;
  } while (n >= 1);
}
