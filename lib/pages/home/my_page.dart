import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/model/userInfo.dart';
import 'package:sanyu_music_master/utils/net_utils.dart';
import 'package:sanyu_music_master/widgets/common_text_style.dart';
import 'package:sanyu_music_master/widgets/components/selfTopMenuPageItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global.dart';
import 'discover.dart';

class MyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyPage();
  }
}
class _MyPage extends State<MyPage>{
  List<Profile> userInfo = [];
  var userName;

  final List<MenuItem> _mylistMenus = [
    MenuItem(icon: 'images/icon_download.png', text: '本地音乐'),
    MenuItem(icon: 'images/icon_cloud.png', text: '云盘'),
    MenuItem(icon: 'images/icon_purchased.png', text: '已购'),
    MenuItem(icon: 'images/icon_recently_played.png', text: '最近播放'),
    MenuItem(icon: 'images/icon_my_concerns.png', text: '我的关注'),
    MenuItem(icon: 'images/icon_collection.png', text: '收藏与赞'),
    MenuItem(icon: 'images/icon_radio_station.png',text: '我的电台'),
    MenuItem(icon: 'images/icon_add.png',text: '音乐应用')
  ];
  @override
  void initState() {
    // TODO: implement initState
    getUserInfo();
  }
  getUserInfo() async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.get('userId');
      final response = await DioUtil.getInstance()
          .post("$API_PREFIX/user/detail?uid=$userId", {});
      final result = json.decode(response.toString());
      if(result['code'] == 200){
        userInfo.add(Profile.fromJson(result['profile']));
        setState(() {
        });
      }else{
        showToast(response.data['message']);
      }
    }catch(e){
      showToast('未知错误');
      print(e);
      throw(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _selfMessagePage(),
            _selfTopMenuPage(),
          ],
        ),
      )
    );
  }
  Widget _selfMessagePage(){
    return Padding(
      padding: EdgeInsets.fromLTRB(30,20,0,20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: ClipOval(
              child: Image.asset(
                "images/my_photo.png",
                width: 70,
                height: 70,
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("三鱼",style: commonTextStyle,),
                  Text("Lv.6",style: commonGrayTextStyle,)
                ],
              )
          ),
          SizedBox(width: 10,),
          Expanded(
            flex: 1,
              child: Icon(Icons.navigate_next,),
          )
        ],
      ),
    );
  }
  Widget _selfTopMenuPage(){
    return Padding(
        padding:EdgeInsets.symmetric(horizontal: 20,vertical: 18),
        child: Container(
          padding: EdgeInsets.only(top: 23),
          height: 220,
          width: 600,
          decoration: BoxDecoration(
            border: Border.all(color:Colors.grey,width: 1),
            borderRadius: BorderRadius.all( Radius.circular(14)),
          ),
          child:GridView.builder(
              itemCount: _mylistMenus.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:4,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index){
                return SelfTopMenuPageItem(
                  urlIcon: _mylistMenus[index].icon,
                  text: _mylistMenus[index].text,
                );
              }
          )
      ),
    );
  }
}