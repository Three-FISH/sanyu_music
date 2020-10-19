import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanyu_music_master/pages/play_list/play_list_page.dart';
import 'package:sanyu_music_master/widgets/common_text_style.dart';
import 'package:sanyu_music_master/widgets/components/iconTextWidget.dart';

class PlaySongPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _PlaySongPage();
  }
}

class _PlaySongPage extends State<PlaySongPage> with TickerProviderStateMixin{
  bool flag = false;
  AnimationController _recordController;
  AnimationController _needleController;
  Animation<double> _needleAnimation;

  @override
  void initState() {
    super.initState();
    _recordController = AnimationController(
      duration: Duration(seconds: 20), vsync: this,
    );
    _needleController = AnimationController(
        duration: Duration(milliseconds: 400),vsync: this
    );
    _needleAnimation = Tween<double>(begin: -0.01, end: -0.07).animate(_needleController);

    _recordController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _recordController.reset();
        _recordController.forward();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if(flag == true){
      _recordController.forward();
      _needleController.reverse();
    }else{
      _recordController.stop();
      _needleController.forward();
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/play_song_bg.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 40,
              sigmaX: 40,
            ),
            child: Container(
              color: Colors.black12,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          AppBar(
            centerTitle: true,
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Colors.white),
            //  elevation: 0,
            backgroundColor: Colors.transparent,
            leading: new IconButton(
                icon: Icon(Icons.arrow_back_outlined), onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return PlayListPage();
              }));
            }),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "生命因你而火热",
                  style: commonWhiteTextStyle,
                ),
                Text(
                  "新裤子乐队",
                  style: smallNoteTextStyle,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child:  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.only(top: 220),
                          child:RotationTransition(
                              turns: _recordController,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    "images/play_song_record.png",
                                    width: 340,
                                  ),
                                  Container(
                                    width:224,
                                    height: 224,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/my_photo.png"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(200)),
                                    ),
                                  )
                                ],
                              )
                          ) ,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child:Container(
                          padding: EdgeInsets.fromLTRB(100, 78, 0, 0),
                          child: RotationTransition(
                            alignment:  Alignment(
                                -1 + (45 /146),
                                -1 + (45/252)),
                            turns: _needleAnimation,
                            child: Image.asset(
                              "images/play_song_needle.png",
                              width:146,
                              height: 252,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconTextWidget(
                          "images/icon_music_dislike.png",60
                      ),
                      IconTextWidget(
                          "images/icon_music_download.png",60
                      ),
                      IconTextWidget(
                          "images/icon_music_sing.png",60
                      ),
                      IconTextWidget(
                          "images/icon_music_comment.png",60
                      ),
                      IconTextWidget(
                          "images/icon_music_more.png",60
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120,)
              ],

            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: Icon(Icons.play_circle_outline,size: 60,color: Colors.white,),
              onPressed: (){
                if(flag == true){
                  flag = false;
                }else{
                  flag = true;
                }
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    _recordController.dispose();
    _needleController.dispose();
    super.dispose();
  }
}