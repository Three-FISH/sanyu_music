import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/widgets/components/playListCoverWidget.dart';

import '../../widgets/common_text_style.dart';
import '../../widgets/components/musicAllPlayBar.dart';

class PlayListPageTop extends StatelessWidget {
  final double expandedHeight;
  final String bgUrl;
  final String title;
  final int count;

  const PlayListPageTop(
      {Key key, this.expandedHeight, this.bgUrl, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      expandedHeight: expandedHeight,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.grey,
      brightness: Brightness.dark,
      leading: new IconButton(
          icon: Icon(Icons.arrow_back_outlined), onPressed: () {}),
      actions: <Widget>[
        new IconButton(
          icon: Icon(Icons.search_rounded),
          onPressed: () {},
        ),
        new IconButton(icon: Icon(Icons.more_horiz_outlined), onPressed: () {})
      ],
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
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 90, 10, 10),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PlayListCoverWidget(
                        "https://tpc.googlesyndication.com/simgad/8593981413023260756?sqp=4sqPyQQ7QjkqNxABHQAAtEIgASgBMAk4A0DwkwlYAWBfcAKAAQGIAQGdAQAAgD-oAQGwAYCt4gS4AV_FAS2ynT4&rs=AOga4qmeC9TSiuEECfc0i2oHF7I4oNgplw",
                        playCount: 250,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "民谣与吉他：玫瑰花都开了",
                              style: commonWhiteTextStyle,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "维格尼亚",
                              style: mWhiteTextStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "有一次在地铁口，遇见一个卖栀子花的老太太，满头银发，一口苏白，和她交流推荐",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: smallNoteTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Image.asset("images/icon_comment.png"),
                            Text("99",style:mWhiteTextStyle,),
                          ],
                        ),
                        onTap: (){
                          showToast("点击展开评论");
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Image.asset("images/icon_share.png"),
                            Text("96",style:mWhiteTextStyle,),
                          ],
                        ),
                        onTap: (){
                          showToast("点击展开分享");
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Image.asset("images/icon_music_download.png"),
                            Text("下载",style:mWhiteTextStyle,),
                          ],
                        ),
                        onTap: (){
                          showToast("点击下载");
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Image.asset("images/icon_select.png"),
                            Text("多选",style:mWhiteTextStyle,),
                          ],
                        ),
                        onTap: (){
                          showToast("点击多选");
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
