import 'dart:math' as math;
void main(){
  printData();
  personajeData();
}

void printData(){
  final cuadrado=new Cuadrado(2);
  cuadrado.area=100;
  print(" area ${cuadrado.calcularArea()}");
  print(" lado ${cuadrado.lado}");
  print(" area get ${cuadrado.area}");
}
class Cuadrado {
  double lado;
  double get area{
    return this.lado*this.lado;
  }
  set area(double valor){
    this.lado=math.sqrt(valor);
  }
  Cuadrado(double lado):
    this.lado=lado;

  double calcularArea(){
    return this.lado*this.lado;
  }
}

abstract class Personaje{
  String? poder;
  String nombre;

  Personaje(this.nombre);

  @override
  String toString(){
    return '$nombre - $poder';
  }
}

class Heroe extends Personaje{
  int valebtia=100;
  Heroe(String nombre): super(nombre);
}
class Villano extends Personaje{
  int maldad=50;
  Villano(String nombre): super(nombre);
}

void personajeData(){
  final peter=new Heroe("Spiderman");
  final cleteus=new Villano("Canage");
  print(peter);
  print(cleteus);
}