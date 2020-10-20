import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../common_text_style.dart';

class MusicAllPlayBar extends StatelessWidget implements PreferredSizeWidget{
  final int count;

  const MusicAllPlayBar({Key key, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      child: Container(
        color: Colors.white,
        child: InkWell(
          onTap: (){
            showToast("点击了全部播放");
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20,right: 10,top: 20),
                child: Icon(
                  Icons.play_circle_outline,
                  size: 40,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("播放全部",style: commonBlackTextStyle,),
              ),
              SizedBox(width: 4,),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("(共$count首)",style: smallCommonTextStyle,),
              ),
            ],
          ),
        ),
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);

}