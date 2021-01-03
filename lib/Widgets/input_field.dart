import 'package:ecommerce/Constant.dart';
import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
  final String hinttext;
  final Function(String) onChanged;
  final Function(String) onSubmit;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  InputField({this.hinttext, this.onChanged, this.onSubmit, this.focusNode});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal:24.0
      ),
      decoration: BoxDecoration(
        color: Color(0*ffff),
        borderRadius: BorderRadius.circular(12.0)

      ),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hinttext ?? "text...",
          contentPadding: EdgeInsets.symmetric(horizontal: 24.0,
          vertical: 24.0)
        ),
        style:Constant.regularDarkText
      )
    );
  }
}
