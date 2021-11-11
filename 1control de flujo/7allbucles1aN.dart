import 'dart:io';

void main() {
  stdout.write("Ingrese el Numero n para los bucles: ");
  var numero = stdin.readLineSync();
  int n = int.parse(numero!);
  bucleFor(n);
  bucleWhile(n);
  bucleDoWhile(n);
}

// bucle flor
void bucleFor(int n) {
  print("\n ****** Bucle For *********\n");
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}

// bucle while
void bucleWhile(int n) {
  print("\n ****** Bucle While *********\n");
  int i = 1;
  while (i <= n) {
    print(i);
    i++;
  }
}

// bucle do while
void bucleDoWhile(int n) {
  print("\n ****** Bucle Do While *********\n");
  int i = 1;
  do {
    print(i);
    i++;
  } while (i <= n);
}
