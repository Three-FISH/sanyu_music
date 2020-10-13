import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/model/banner.dart';
import 'package:sanyu_music_master/model/personalSong.dart';
import 'package:sanyu_music_master/model/recommendSongs.dart';
import 'package:sanyu_music_master/pages/home/discover/discover_list_page.dart';
import 'package:sanyu_music_master/pages/play_list/play_list_page.dart';
import 'package:sanyu_music_master/utils/net_utils.dart';
import 'package:sanyu_music_master/widgets/common_text_style.dart';
import 'package:sanyu_music_master/widgets/components/moreClickWidget.dart';
import 'package:sanyu_music_master/widgets/components/playListCoverWidget.dart';
import 'package:sanyu_music_master/widgets/components/playListSongWidget.dart';
import 'package:sanyu_music_master/widgets/components/playListWidget.dart';

import '../../global.dart';

class DiscoverPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DiscoverPage();
  }
}
class _DiscoverPage extends State<DiscoverPage>{
  List <Recommend> playListData=[];
  List <DailySongs> recommendSongsData=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPersonalSongList();
    getRecommendSongs();
  }
  getPersonalSongList() async{
    print("请求推荐歌单");
    try{
      Response response = await Dio()
          .get("$API_PREFIX/personalized?limit=6")
          .catchError((e) {
        print(e);
      });
      var result = json.decode(response.toString());
      List<Recommend> personalSongList = [];
      if(result['code'] == 200){
        result['result'].forEach((e){
          personalSongList.add(Recommend.fromJson(e));
        });
        setState(() {
          playListData = personalSongList;
        });
      }else{
        showToast(response.data['message']);
      }
    }catch(e){
      showToast('未知错误');
      print(e);
      throw e;
    }

  }
  getRecommendSongs() async{
    print("请求推荐歌曲");
    try{
      Response response = await DioUtil.getInstance()
          .post("$API_PREFIX/recommend/songs", {});
      final result = json.decode(response.toString());
      List<DailySongs> dailySongs = [];
      if(result['code'] >= 200&&result['code'] <300){
        result['data']['dailySongs'].forEach((e){
          dailySongs.add(DailySongs.fromJson(e));
        });
        setState(() {
          recommendSongsData = dailySongs;
        });
      }else{
        showToast(response.data['message']);
      }
    }catch(e){
      showToast('未知错误');
      print(e);
      throw e;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerPage(),
            _menuPage(),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '人气歌单推荐',
                    style: commonTextStyle,
                  ),
                  MorePage(
                    text: "查看更多",
                    flag: -1,
                  ),
                ],
              )
            ),
            _recommendPage(),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 16, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '道不尽的华语深情',
                      style: commonTextStyle,
                    ),
                    MorePage(
                      text: "播放全部",
                      flag: 1,
                    ),
                  ],
                )
            ),
            _songPlaylistPage(),
            _musicCalendar(),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '热歌风向标',
                      style: commonTextStyle,
                    ),
                    MorePage(
                      text: "查看更多",
                      flag: -1,
                    ),
                  ],
                )
            ),
            _hotSongList(),
          ],
        ),
      ),

    );
  }
  ///菜单栏
 Widget  _menuPage(){
    final List<MenuItem> _menus = [
      MenuItem(icon: 'images/icon_daily.png', text: '每日推荐'),
      MenuItem(icon: 'images/icon_fm.png', text: '私人FM'),
      MenuItem(icon: 'images/icon_playlist.png', text: '歌单'),
      MenuItem(icon: 'images/icon_rank.png', text: '排行榜'),
      MenuItem(icon: 'images/icon_look.png', text: '直播'),
      MenuItem(icon: 'images/icon_radio.png', text: '电台'),
      MenuItem(icon: 'images/icon_album.png',text: '数字专辑'),
      MenuItem(icon: 'images/icon_fire.png',text: '火前留名')
    ];
      return  Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        height: 130,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _menus.length,
          itemBuilder:(context,index){
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children:<Widget> [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black12, width: 0.5),
                            gradient: RadialGradient(
                              colors: [
                                Color(0xFFFF8174),
                                Colors.red,
                              ],
                              center: Alignment(-1.7, 0),
                              radius: 1,
                            ),
                            color: Colors.red),
                      ),
                      Image.asset(
                        _menus[index].icon,
                        width: 60,
                        height: 60,
                      ),

                    ],
                  ),
                  SizedBox(height: 6,),
                  Text(_menus[index].text)
                ],
              ),
            );
          },
          separatorBuilder: (context,index){
            return SizedBox(width:2);
          },
        ),
      );
  }
  ///推荐歌单
  Widget  _recommendPage(){
    return  Container(
      height: 180,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
                padding: EdgeInsets.only(left: 10),
                child: PlayListWidget(
                  text: playListData[index].name,
                  picUrl: playListData[index].picUrl,
                  playCount: playListData[index].playCount,
                  maxLines: 2,
                  onTap: () {
                    print("点击了封面");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return PlayListPage();
                    }));
                  },
                ),
            );
          },
          separatorBuilder: (context,index){
            return SizedBox(width:1);
          },
          itemCount: playListData.length
      ),
    );
  }
  ///播放全部歌单
  Widget _songPlaylistPage(){
    return Container(
       height: 280,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          childAspectRatio: 0.25,
        ),
        itemBuilder: (context,index){
          return PlayListSongWidget(
            picUrl: recommendSongsData[index].al.picUrl,
            text: recommendSongsData[index].name,
            subText: recommendSongsData[index].reason,
            onTap: (){
              print("点击了歌曲播放");
            },
          );
        },
      ),
    );
  }
  ///音乐日历
  Widget _musicCalendar(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 40),
      child: Container(
        width: 500,
        height: 160,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all( Radius.circular(14)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2, //阴影范围
              spreadRadius: 1, //阴影浓度
              color: Colors.grey, //阴影颜色
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.music_note,color: Colors.red,),
                  Text("音乐日历",style: commonTitleStyle,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("明天",style: commonBlackTextStyle,),
                     SizedBox(height: 10,),
                     Text("预告-叮当最新作品",style: commonGrayTextStyle,),
                   ],
                 ),
                  PlayListCoverWidget(
                    "images/list_cover.png",
                    playCount: null,
                    width: 70,
                    height: 70,
                  )
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
  ///热歌榜单
  Widget _hotSongList(){
    return Container(
      height: 200,
    );
  }
}
class MenuItem {
  String icon;
  String text;

  MenuItem({this.icon, this.text});
}