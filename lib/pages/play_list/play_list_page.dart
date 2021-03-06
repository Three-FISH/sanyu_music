import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/model/musicPlay.dart';
import 'package:sanyu_music_master/pages/play_list/music_play_widget.dart';
import 'package:sanyu_music_master/pages/play_list/play_list_page_top.dart';
import 'package:sanyu_music_master/widgets/components/musicPlayItem.dart';
class PlayListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PlayListPage();
  }
}
class _PlayListPage extends State<PlayListPage>{
  List<List<dynamic>> musicList = [
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
    [
      1,
      "这就是爱吗（翻自 蜡笔小新）",
      "王巨星 -搁浅"
    ],
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            child: CustomScrollView(
              slivers: <Widget>[
                PlayListPageTop(
                  expandedHeight: 340,
                  bgUrl: "images/list_cover.png",
                  title: "官方动态歌单",
                  count: 15,
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return MusicPlayItem(
                        onTap: (){
                          showToast("点击了音乐条目播放");
                        },
                        musicData: MusicData(
                          mvid: musicList[index][0],
                          index: index + 1,
                          songName: musicList[index][1],
                          artists:musicList[index][2],
                        ),
                      );
                    },
                      childCount: musicList.length,
                    )
                ),

              ],
            ),

          ),
          MusicPlayWidget(),
        ],
      ),
    );
  }

}