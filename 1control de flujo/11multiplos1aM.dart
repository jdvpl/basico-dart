import 'dart:io';

void main() {
  multiplos();
}

void multiplos() {
  int multiplo = 7;
  int limiteM = 123;
  for (int i = 1; i <= limiteM; i++) {
    if (i % multiplo == 0) print(i);
  }
}
