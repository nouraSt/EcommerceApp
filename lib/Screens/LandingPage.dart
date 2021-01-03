import 'package:ecommerce/Constant.dart';
import 'package:ecommerce/Screens/Home_page.dart';
import 'package:ecommerce/Screens/Login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/';



class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _initialization,
        builder: (context,snapshot) {
      if(snapshot.hasError){
        return Scaffold(
          body: Center(
              child: Text("error: ${snapshot.error}");
          ),
        );
      }
      if(snapshot.connectionState== ConnectionState.done){
        return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, streamsnapshot) {
            if(streamsnapshot.hasError){
              return Scaffold(
                body: Center(
                    child: Text("error: ${streamsnapshot.error}");
                ),
              );


            }
            if(streamsnapshot.connectionState == ConnectionState.active){
                User _user = streamsnapshot.data;
                if(_user == null){
                  return Login_Page();
                } else {
                  return Home_page();
                }
            }
          }
        );
      }

      return Scaffold(
          body: Center(
              child: Text("initialization appp",
              style: Constant.regularheading),
          )
      );
    );
  }
  }