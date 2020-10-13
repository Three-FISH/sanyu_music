import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashPage();
  }
}
class _SplashPage extends State<SplashPage> with TickerProviderStateMixin{
  AnimationController _logoController;
  Tween _scaleTween;
  CurvedAnimation _logoAnimation;
  @override
  void initState(){
    super.initState();
    _scaleTween = Tween(begin: 0,end: 1);
    _logoController =AnimationController(vsync: this,duration: Duration(milliseconds: 500))
    ..drive(_scaleTween);
    Future.delayed(Duration(milliseconds:500 ),(){
      _logoController.forward();
    });
    _logoAnimation = CurvedAnimation(parent: _logoController,curve: Curves.easeOutQuart);
    _logoController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Future.delayed(Duration(milliseconds:500 ),(){
          LoginPage();
        });
      }
    });
  }
  void goPage() async{
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ScaleTransition(
          //动画控制器
          scale:_logoAnimation ,
          //将要执行动画的子view
          child:Hero(
            tag: 'logo',
            child: Image.asset('images/music_logo.png'),
          ) ,

        ),

      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _logoController.dispose();
  }
}