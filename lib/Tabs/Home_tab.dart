import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Constant.dart';
import 'package:ecommerce/Widgets/CustomActionBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Screens/product_page.dart';

class Home_tab extends StatelessWidget {
  final CollectionReference _productRef = FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
        FutureBuilder<QuerySnapshot>(
            future: _productRef.get(),
            builder: (context, snapshot) {
                   if(snapshot.hasError){
                return Scaffold(
                   body: Center(
                  child: Text("error: ${snapshot.error}");
                 ),
            );
             }
              if(snapshot.connectionState == ConnectionState.done){
                   return ListView(
                   padding: EdgeInsets.only(
                   top:100.0,
                   bottom: 24.0
                   ),
                   children: snapshot.data.docs.map((document) {
                     return GestureDetector(
                        onTap: (){   Navigator.push(context, MaterialPageRoute(
                          builder: (context) => productPage(id: document.id )))
                               },
                       child: Container(
                       decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12.0),
                       ),
                       height: 35.0,
                       margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0) ,
                       child: Stack(
                         children: [
                           Container(
                             height: 350.0,
                             child: ClipRRect(
                             borderRadius: BorderRadius.circular(20.0),
                             child: Image.network("${document.data().["image"][0]}",
                              fit: BoxFit.cover,),),
                           ),
                          Positioned(
                               bottom:0,
                               left:0,
                               right:0,

                               child: Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                                 child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                       Text(document.data()['name'] ?? "product name", style: Constant.regularheading,),
                                         Text(document.data()['price'] ?? "product price",style: Constant.regularheading )
                                         ]
                                  ),
                               ))
                       ),
                       ,
                       ]



                       ),
                     );
                                 }).toList(),
                   )
                }
            return Scaffold(
             body: Center(
           child: CircularProgressIndicator();
            ),
              );
                    },

    )

    ,
        CustomActionBar(title: "Home page",
                    hasBackArrrow : true,

             )

          ]
    );
  }
}
