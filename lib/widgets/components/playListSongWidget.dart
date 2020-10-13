import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanyu_music_master/widgets/components/playListCoverWidget.dart';

import '../common_text_style.dart';

class PlayListSongWidget extends StatelessWidget{
  final String picUrl;
  final String text;
  final String subText;
  final VoidCallback onTap;

  PlayListSongWidget({this.picUrl, this.text, this.subText,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    child:picUrl == null ? Container() : PlayListCoverWidget(
                      picUrl,
                      playCount: null,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(text,style: smallCommonTextStyle,),
                          Text(
                            subText,
                            style: smallGrayTextStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:Container(
                    child: Icon(Icons.play_circle_outline_sharp,color: Colors.red,),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

}