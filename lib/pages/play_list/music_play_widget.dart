import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/pages/play_list/play_song_page.dart';

import '../../widgets/common_text_style.dart';

class MusicPlayWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 0.6, color:Colors.grey),
          ),
        ),
        child:GestureDetector(
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 10,),
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: AssetImage('images/my_photo.png'),
                  ),
                ),
              ),
              SizedBox(width: 14,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("关于郑州的记忆",style: cBlackTextStyle,),
                      Text("南京市民-李先生",style: smallGrayTextStyle,)
                    ],
                  )
              ),
              GestureDetector(
                child: Image.asset("images/play.png",width: 35,),
                onTap: (){
                  showToast("点击播放");
                },
              ),
              SizedBox(width: 10,),
              GestureDetector(
                child: Image.asset("images/list.png",width: 35,),
                onTap: (){
                  showToast("点击播放列表");
                },
              ),

            ],
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return PlaySongPage();
            }));
          },
        ),
      ),
    );
  }

}