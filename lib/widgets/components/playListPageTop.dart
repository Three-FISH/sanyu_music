import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_text_style.dart';
import 'musicAllPlayBar.dart';

class PlayListPageTop extends StatelessWidget{
  final double expandedHeight;
  final String bgUrl;
  final String title;
  final int count;

  const PlayListPageTop({Key key, this.expandedHeight, this.bgUrl, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: expandedHeight,
      pinned: true,
      elevation: 0,
      brightness:Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: commonWhiteTextStyle,
      ),
      bottom: MusicAllPlayBar(
        count: count,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Image.asset(
              "images/list_cover.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                height: double.infinity,
              ),

            )
          ],
        ),
      ),

    );
  }

}