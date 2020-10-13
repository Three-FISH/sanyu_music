import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget{
  final String text;
  final int flag;
  MorePage({
    @required this.text,
    this.flag
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all( Radius.circular(14)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: Row(
            children: [
              flag == -1 ? Container():Padding(
                  padding: EdgeInsets.only(right: 1),
                child:  Image.asset(
                  'images/icon_triangle_solid.png',
                  width: 14,
                  height: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                  text
              ),
            ],
          )
        )
    );
  }

}