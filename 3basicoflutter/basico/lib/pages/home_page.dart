import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Column(
              children: [
                Icon(Icons.phone, size: 30,),
                Container(
                  child: const Text("CALL",style:TextStyle(color: Colors.red),),
                )
              ],
            ),
            Column(
              children: [
                Icon(Icons.directions,size: 30,color: Colors.cyan,),
                Container(
                  child: const Text("ROUTE",style:TextStyle(color: Colors.red),),
                )
              ],
            ),
            Column(
              children: [
                Icon(Icons.share, size: 30,color: Colors.cyan,),
                Container(
                  child: const Text("SHARE",style:TextStyle(color: Colors.red, ),),
                )
              ],
            ),
          ],),),
          ], 
        ),
      ),
    );
  }
}