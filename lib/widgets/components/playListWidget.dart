import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanyu_music_master/widgets/components/playListCoverWidget.dart';

import '../common_text_style.dart';

class PlayListWidget extends StatelessWidget{
  final String picUrl;
  final String text;
  final String subText;
  final num playCount;
  final int maxLines;
  final VoidCallback onTap;
  final int index;
  PlayListWidget({
    this.picUrl,
    this.text,
    this.playCount,
    this.subText,
    this.onTap,
    this.maxLines=-1,
    this.index,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            picUrl == null ? Container() : PlayListCoverWidget(
              picUrl,
              playCount: playCount,
            ),
            index == null ? Container() : Text(index.toString(), style: commonGrayTextStyle,),
            SizedBox(height: 5,),
            Text(
              text,
              style: smallCommonTextStyle,
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
            subText == null ? Container() : SizedBox(height: 2,),
            subText == null
                ? Container()
                : Text(
              subText,
              style: commonGrayTextStyle,
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
          ],
        ),
      ),
    );
  }

}