import 'dart:io';
import 'dart:math';
void main(){
  bool isfalse=true;
  stdout.write("Escriba el primer numero ");
  var b = stdin.readLineSync();
  double numero = double.parse(b!);
  while (isfalse) {
    stdout.write("\nQue deseas hacer con el $numero ");
    stdout.write("\n1. Sumar ");
    stdout.write("\n2. Restar ");
    stdout.write("\n3. Multiplicar ");
    stdout.write("\n4. Dividir ");
    stdout.write("\n5. Elevar numero ");
    stdout.write("\n6. Salir del programa \n");
    var a = stdin.readLineSync();
    int opcion = int.parse(a!);

    if(opcion>=1 && opcion <=5){
      if(opcion==1){
        stdout.write("$numero ➕  ");
        var m = stdin.readLineSync();
        double y = double.parse(m!);
        numero=numero+y;
        stdout.write("\n\u{1f605}: $numero \n");
      }else if(opcion==2){
        stdout.write("$numero ➖  ");
        var m = stdin.readLineSync();
        double y = double.parse(m!);
        numero=numero-y;
        stdout.write("\n\u{1f60e} : $numero \n");
      }else if(opcion==3){
        stdout.write("$numero ❌  ");
        var m = stdin.readLineSync();
        double y = double.parse(m!);
        numero=numero*y;
        stdout.write("\n\u{1f600}: $numero \n");
      }else if(opcion==4){
        stdout.write("$numero ➗  ");
        var m = stdin.readLineSync();
        double y = double.parse(m!);
        numero=numero/y;
        stdout.write("\n\u{1f600}: $numero \n");
      }else if(opcion==5){
        stdout.write("$numero ^ ");
        var m = stdin.readLineSync();
        int y = int.parse(m!);
        var ss=pow(numero,y);
        numero=double.parse("$ss");
        stdout.write("\n\u{1f44d}: $numero \n");
      }
    }else{
      print("has salido del programa");
      isfalse=false;
    }
  }
}


