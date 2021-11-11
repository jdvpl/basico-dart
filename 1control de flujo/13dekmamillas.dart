
import 'dart:io';
void main(){
  stdout.write("Ingrese las millas a convertir: ");
  var a = stdin.readLineSync();
  double millas = double.parse(a!);
  print("$millas millas equivales a ${fromMilesToKms(millas)} Kilometros");
}
double fromMilesToKms(double miles){
  return miles*1.60934;
}