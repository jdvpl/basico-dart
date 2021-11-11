void main()async{
  print("antes");
  final data=await httpGet("https://api.nasa.com/aliens");
  print(data);
  print("fina");
}

Future<String> httpGet(String url){
  return Future.delayed(
    Duration(seconds:3), ()=>'3 Segundos'
  );
}