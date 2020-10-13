
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/model/banner.dart' as mBanner;
import 'package:sanyu_music_master/widgets/components/customBanner.dart';

import '../../../global.dart';


class BannerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BannerPage();
  }
}
class _BannerPage extends State<BannerPage>{
  List<mBanner.Banners> bannerData= [];
  List<String> urlData = [];
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async{
    try{
      Response response = await Dio()
          .get("$API_PREFIX/banner?type=1")
          .catchError((e){
            print(e);
            throw(e);
      });
      var result = json.decode(response.toString());
      List<mBanner.Banners> banner = [];
      if(result['code'] == 200){
        result["banners"].forEach((ele) {
          banner.add(mBanner.Banners.fromJson(ele));
        });
        for(int index = 0; index < banner.length; index++){
          urlData.add(banner[index].pic);
        }
        setState(() {
          bannerData = banner;
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
    return (urlData == null) ?
    Container() : CustomBanner(urlData);
  }
}

