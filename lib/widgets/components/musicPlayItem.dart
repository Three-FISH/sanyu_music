import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/model/musicPlay.dart';
import 'package:sanyu_music_master/model/recommendSongs.dart';

import '../common_text_style.dart';

class MusicPlayItem extends StatelessWidget{
  final MusicData musicData;
  final VoidCallback onTap;

  const MusicPlayItem({Key key, this.musicData, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child:Container(
        width: double.infinity,
        height: 90,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 10,),
            Container(
              alignment: Alignment.center,
              width: 60,
              height: 50,
              child: Text(
                musicData.index.toString(),
                style: mGrayTextStyle,
              ),
            ),
            Expanded(
                child:Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      musicData.songName,
                      maxLines: 1,
                      overflow:TextOverflow.ellipsis,
                      style: commonBlackTextStyle,
                    ),
                    SizedBox(height: 4,),
                    Text(
                      musicData.artists,
                      maxLines: 1,
                      overflow:TextOverflow.ellipsis,
                      style: smallGrayTextStyle,
                    ),
                  ],
                )
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  showToast("点击获取更多");
                },
                color: Colors.grey,
              ),
            )
          ],
        ),

      ) ,
    );
  }

}