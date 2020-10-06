import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_with_api/views/home.dart';


void main()=> runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black,), onPressed: (){


            })
          ],
          title: Text("Shopping App",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: HomeScr(),
      ),
    );
  }
}
