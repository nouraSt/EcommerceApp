import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Widgets/CustomActionBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                     return Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12.0),
                     
                     ),
                     height: 35.0,
                     margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0) ,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20.0),
                       child: Image.network("${document.data().["image"][0]}",
                        fit: BoxFit.cover,)),
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
