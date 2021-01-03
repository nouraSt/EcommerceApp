import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class bottom_tabs extends StatefulWidget {
  @override
  _bottom_tabsState createState() => _Bottom_tabsState();
}

class _bottom_tabsState extends State<Bottom_tabs> {
   int _selectedone=0;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
               blurRadius: 1.0,
               color: Colors.black.withOpacity(0.5),
               spreadRadius: 1.0,

      )
          ]
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Buttonn(,selected: _selectedone ==0? true: false,onpressed:
           (){
        setState(() {
          _selectedone=0;
             });    )

      }),
          Buttonn(,selected:),
          Buttonn(),
          Buttonn(),


        ],
      ),
    );
  }
}


class Buttonn extends StatelessWidget {
  final String imagepath;
  final bool selected;
  final Function onpressed;
  Buttonn({this.imagepath, this.selected, this.onpressed});
  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color:_selected? Theme.of(context).accentColor : Colors.black,
              width:2.0
            )
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Image(image: AssetImage(imagepath ?? ),),
        width: 22.0,
        height: 22.0,
      ),
    );
  }
}

