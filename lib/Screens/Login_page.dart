import 'package:ecommerce/Constant.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Widgets/Costum_button.dart';
import 'package:ecommerce/Widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  String _loginEmail="";
  String _LoginPassword="";
  FocusNode _passwordFocusNode;
  bool _outline;

  Future<String> _createAccount() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail,
          password: _LoginPassword
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Welcome user \n , login to your account", textAlign: TextAlign.center,style: Constant.boldheading),
              ),
              Column(
                children: [
                  InputField(hinttext: "Email",
                    onChanged:(value) {
                      _loginEmail = value;
                    },
                    onSubmit: (value) {
                      _passwordFocusNode.requestFocus();
                    },

                  ),
                  InputField(hinttext: "Password",
                    onChanged:(value) {
                      _LoginPassword = value;
                    },
                    onSubmit: (value) {
                      _passwordFocusNode.requestFocus();
                    },),
                  CustomButton(
                    text: "login",
                    onpressed: (){
                      print("clicked the button")
                    },


                  )
                ],
              )
              CustomButton(text:"Create new account", onpressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context) => registerPage() ),  ),

              },
              isOutline: true,),
            ]
          ),
        ),
      )
    );
  }
}

