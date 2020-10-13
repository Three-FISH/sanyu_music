import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanyu_music_master/utils/numberUtils.dart';

import '../common_text_style.dart';

class PlayListCoverWidget extends StatelessWidget {
  final String url;
  final int playCount;
  final double width;
  final double height;
  final double radius;

  PlayListCoverWidget(this.url,
      {this.playCount, this.width = 120, this.height, this.radius = 14});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        image: DecorationImage(
          image: NetworkImage(
              url
          )
        )
      ),
      width: width,
      height: height ?? width,
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          playCount == null
              ? Container()
              : Padding(
            padding: EdgeInsets.only(
              top: 2,
              right: 5,),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'images/icon_triangle.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '${NumberUtils.amountConversion(playCount)}',
                  style: smallWhiteTextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}