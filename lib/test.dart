import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanyu_music_master/model/banner.dart' as mBanner;
import 'package:sanyu_music_master/utils/net_utils.dart';


class TestUrl extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TestUrl();
  }
}
class _TestUrl extends State<TestUrl>{
  List<mBanner.Banners> _bannerData = [];
  List<String> testData= [];
  @override
  void initState() {
    getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Text(testData.toString()),
      ),
    ) ;
  }

  getMessage() async{
    Dio dio = new Dio();
    Response response =await dio.get("http://10.10.68.249:3000/banner?type=1");
    var result = json.decode(response.toString());
    List<mBanner.Banners> banners = [];
    List<String> bannerUrl =[];

    if (result["code"] == 200) {
      result["banners"].forEach((ele){
        banners.add(mBanner.Banners.fromJson(ele));
        bannerUrl.add(mBanner.Banners.fromJson(ele).pic);
      });
      setState(() {
        testData = bannerUrl;
      });
    } else {
      print("error:获取失败了");
    }
  }
}


