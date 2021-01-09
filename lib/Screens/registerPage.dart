import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/Widgets/Costum_button.dart';
import 'package:ecommerce/Widgets/input_field.dart';


class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPage extends State<registerPage> {
  bool _registerformloading = false;
  String _registerEmail="";
  String _registerPassword="";
  FocusNode _passwordFocusNode;

 void _submitForm() async{
   setState(() {
     _registerformloading=true;
   });
         String _createAccountFeedback = await _createAccount();
         if(_createAccountFeedback!=null) {
             _dialog(_createAccountFeedback);
             setState(() {
               _registerformloading=true;
             });
         }else {
              Navigator.pop(context);
         }

 }

 Future<String> _createAccount() async {
   try {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: _registerEmail,
         password: _registerPassword
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
  void initState() {
    _passwordFocusNode = FocusNode();
    _
     super.initState();
  }



  @override
  void dispose() {
    _passwordFocusNode.dispose();
      super.dispose();
  }



  Future<void> _dialog(String error) async{
   return showDialog(context: context,
       barrierDismissible: false,
       builder: (context){
     return AlertDialog(
       title: Text(error),
       content: Container(
         child: Text("just some random text from now"),
         actions: [
           FlatButton(
             child: Text("close dialog"),
             onPressed:
               setState((){});
           }
           )
         ]
       )
     )
   })
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
                        _registerEmail = value;
                      },
                      onSubmit: (value) {
                        _passwordFocusNode.requestFocus();
                      },),
                      InputField(hinttext: "Password",
                      onChanged: (value){
                        _registerPassword = value;
                      },
                        focusNode: _passwordFocusNode ,
                        onSubmit: (value) {
                          _submitForm();
                        },
                      ),
                      CustomButton(
                        text: "login",
                        onpressed: (){
                          _submitForm();
                        },
                        isLoading: _registerformloading,


                      ),

                    ],
                  )
                  CustomButton(text:"Create new account", onpressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => registerPage() ), ),

                  },
                    isOutline: false,),
                ]
            ),
          ),
        )
    );
  }
}