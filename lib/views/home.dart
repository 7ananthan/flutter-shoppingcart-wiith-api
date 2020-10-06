import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class HomeScr extends StatefulWidget {
  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {

  Future<dynamic> getData(String apiUrl) async{

    return http.get(apiUrl).then( (http.Response response){
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      print("Response From Server : "+response.body);

      setState(() {
         data  = json.decode(response.body);

      });

    } );

  }
  List data;
  @override
  void initState() {
    getData("https://shopping-cart-flutter.herokuapp.com/items/viewall");
    //categories =getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://images-eu.ssl-images-amazon.com/images/G/31/im")
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:NetworkImage("https://images-eu.ssl-images-amazon.com/images/G/31/img17/AmazonPay/Ankit/Credit-Card-Bill_1500x600_3._CB403387722_.jpg"
                        ) )
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child:Padding(
              padding: const EdgeInsets.all(8.0),

              child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .75,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0
                  ),
                  itemBuilder: (context,index){
                    return
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 180,
                              width: 160,
                              decoration: BoxDecoration(

                                  color: Color(0XFFe3e3e3),
                                  borderRadius: BorderRadius.circular(14.0)
                              ),
                              child: Image.network(data[index]['image']),
                            ),

                          ),
                          Text(data[index]['title'],style: TextStyle(fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                          Text(" Rs ${data[index]['price']}",style: TextStyle(fontWeight: FontWeight.bold),),
                          FlatButton(
                              onPressed: (){},
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)),
                              color: Colors.orangeAccent,
                              child:
                              Text("Buy")
                          )
                        ],
                      );

                  }),
            ))
      ],
    );
  }
}

