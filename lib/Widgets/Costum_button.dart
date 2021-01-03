import 'package:ecommerce/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  bool isLoading;
  final String text;
  final Function onpressed;
  final bool isOutline;
  CustomButton({this.text, this.onpressed, this.isOutline, this.isLoading});
  @override
  Widget build(BuildContext context) {
    bool _isOutline = isOutline ?? false;
    bool _isLoading = isLoading ?? false;
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 65.0,
        alignment: Alignment.center,
        color: _isOutline ? Colors.transparent : Colors.black,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        margin: EdgeInsets.symmetric(horizontal: 24,
        vertical: 24),
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0,

        ),
        child: Stack(
          children: [
            Visibility(
              visible: _isLoading? false : true,
                child: Text(text ?? "text", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: _isOutline? Colors.black : Colors.white),)),
            Visibility(
              visible: _isLoading,
              child: Center(child:SizedBox(
                height:30.0 ,
                width: 30.0 ,
                child: CircularProgressIndicator(),),),
            ),
          ],
        ),

      ),
    );
  }
}
